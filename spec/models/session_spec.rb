require "rails_helper"

RSpec.describe Session do
  it { is_expected.to belong_to(:user) }

  describe "callbacks" do
    describe "before_create" do

      describe "#set_user_info" do
        subject(:session) { build(:session) }

        before "mock user info" do
          Current.user_agent = "Rails Testing"
          Current.ip_address = "127.0.0.1"
        end

        it "sets user_agent" do
          expect { session.save }.to change(session, :user_agent).from(nil).to("Rails Testing")
        end

        it "sets ip_address" do
          expect { session.save }.to change(session, :ip_address).from(nil).to("127.0.0.1")
        end
      end
    end
  end

  describe "validations"
end
