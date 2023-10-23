class PublicController < ApplicationController
  skip_before_action :authenticate

  def index; end
end
