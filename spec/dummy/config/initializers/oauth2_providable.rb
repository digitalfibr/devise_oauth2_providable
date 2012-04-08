Devise::Oauth2Providable.configure do |config|
  # use default
  config.client_sym = :client_app
  config.refresh_token_sym = :refresh_request
  config.authorization_code_sym = :authorization
  config.access_token_sym = :grant_access_token
end