module Responses
  extend ActiveSupport::Concern

  def not_found!
    raise ActionController::RoutingError, "Not Found"
  end

  def render_not_found
    render file: Rails.public_path.join("404.html"), status: :not_found
  end
end
