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
RSpec.describe User do
  it { is_expected.to have_secure_password }

  it { is_expected.to have_many(:sessions).dependent(:destroy) }

  describe "validations" do
    describe "uniqueness" do
      subject(:user) { create(:user) }

      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    end

    it { is_expected.to validate_presence_of(:email) }
  end
end
