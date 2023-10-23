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
