class Authorization < ActiveRecord::Base
  include Devise::Oauth2Providable::ActiveRecord::AuthorizationCode
end
