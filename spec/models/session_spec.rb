# == Schema Information
#
# Table name: sessions
#
#  id         :bigint           not null, primary key
#  ip_address :string
#  user_agent :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_sessions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
RSpec.describe Session do
  it { is_expected.to belong_to(:user) }

  describe "callbacks" do
    describe "before_create" do

      describe "#set_user_info" do
        subject(:session) { build(:session) }

        let(:user_agent) { Faker::Internet.user_agent }
        let(:ip_address) { Faker::Internet.ip_v4_address }

        before "mock user info" do
          Current.user_agent = user_agent
          Current.ip_address = ip_address
        end

        it "sets user_agent" do
          expect { session.save }.to change(session, :user_agent).from(nil).to(user_agent)
        end

        it "sets ip_address" do
          expect { session.save }.to change(session, :ip_address).from(nil).to(ip_address)
        end
      end
    end
  end

  describe "validations"
end
