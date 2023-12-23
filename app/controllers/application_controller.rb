class ApplicationController < ActionController::Base
  include Authentication
  include SetCurrentRequestDetails
  include Responses
end
