class RedirectsController < ApplicationController
  def show
    return redirect_to home_path if current_user.admin?

    render :show
  end
end
