class ApplicationController < ActionController::Base
  include SetCurrentRequestDetails
  
  before_action :authenticate

  private

  def current_user
    Current.user
  end

  def authenticate
    if (session_record = Session.find_by(id: cookies.signed[:session_token]))
      Current.session = session_record
    else
      redirect_to sign_in_path
    end
  end
end
