class PublicController < ApplicationController
  layout "public"

  skip_before_action :authenticate!

  def index; end
end
