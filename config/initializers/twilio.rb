Twilio.configure do |config|
  config.account_sid = Rails.application.credentials.twilio[:sid]
  config.auth_token = Rails.application.credentials.twilio[:auth_token]
end