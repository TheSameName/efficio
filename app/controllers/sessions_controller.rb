class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: %i[new create]

  before_action :set_session, only: :destroy

  def index
    @sessions = current_user.sessions.order(created_at: :desc)
  end

  def new; end

  def create
    if (user = User.authenticate_by(email: params[:email], password: params[:password]))

      create_session_cookie(user.sessions.create!)

      redirect_to home_path, notice: "Signed in successfully"
    else
      redirect_to sign_in_path(email_hint: params[:email]), alert: "That email or password is incorrect"
    end
  end

  def destroy
    @session.destroy

    redirect_to(sessions_path, notice: "That session has been logged out")
  end

  private

  def set_session
    @session = current_user.sessions.find(params[:id])
  end

  def create_session_cookie(session)
    cookies.signed.permanent[:session_token] = { value: session.id, httponly: true }
  end
end
