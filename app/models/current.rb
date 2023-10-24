class Current < ActiveSupport::CurrentAttributes
  attribute :session
  attribute :request_id, :user_agent, :ip_address

  delegate :user, to: :session, allow_nil: true
end
