FactoryBot.define do
  factory :session do
    user
    user_agent { nil }
    ip_address { nil }
  end
end
