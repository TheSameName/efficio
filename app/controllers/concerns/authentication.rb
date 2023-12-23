module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate!

    helper_method :current_user
  end

  def current_user
    Current.user
  end

  private

  def authenticate!
    if (session = Session.find_by(id: cookies.signed[:session_token]))
      Current.session = session
    else
      redirect_to sign_in_url
    end
  end
end
