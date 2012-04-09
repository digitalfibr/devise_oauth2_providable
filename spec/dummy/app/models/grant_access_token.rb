class GrantAccessToken < ActiveRecord::Base
  include Devise::Oauth2Providable::ActiveRecord::AccessToken
end
