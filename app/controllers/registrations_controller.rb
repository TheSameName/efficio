class RegistrationsController < ApplicationController
  skip_before_action :authenticate!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      create_session_token! @user.sessions.create!

      send_email_verification

      redirect_to root_path, notice: "Welcome! You have signed up successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def send_email_verification
    UserMailer.with(user: @user).email_verification.deliver_later
  end

  def create_session_token!(session)
    # TODO: Catch failures with errors
    cookies.signed.permanent[:session_token] = { value: session.id, httponly: true }
  end
end
