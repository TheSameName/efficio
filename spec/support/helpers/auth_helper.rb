module AuthTestHelper

  def sign_in(user = nil)
    user ||= create(:user)

    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(Current)
      .to receive(:session).and_return(user.sessions.create!)

    allow_any_instance_of(ApplicationController)
      .to receive(:authenticate!).and_return(true)
    # rubocop:enable RSpec/AnyInstance
  end
end

RSpec.configure do |config|
  config.include AuthTestHelper, type: :request
  config.include AuthTestHelper, type: :controller
end
