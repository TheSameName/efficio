class AdminController < ApplicationController
  before_action :authorize_admin!

  private

  def authorize_admin!
    render_not_found unless current_user.admin?
  end
end
