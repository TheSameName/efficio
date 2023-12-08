# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  admin           :boolean          default(FALSE), not null
#  email           :string           not null
#  folder_link     :string           default(""), not null
#  password_digest :string           not null
#  verified        :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  generates_token_for :email_verification, expires_in: 2.days { email }
  generates_token_for :password_reset, expires_in: 20.minutes { password_salt.last(10) }

  before_validation if: :email_changed?, on: :update do
    self.verified = false
  end

  after_update if: :password_digest_previously_changed? do
    sessions.where.not(id: Current.session).delete_all
  end

  has_many :sessions, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true, length: { minimum: 8 }

  validates :folder_link, presence: true
  # validates :folder_link, with: -> { %r{\A(https?://)?([\da-z\.-]+)\.([a-z\.]{2,6})([/\w\.-]*)*/?\Z}i }

  normalizes :email, with: -> { _1.strip.downcase }

end
