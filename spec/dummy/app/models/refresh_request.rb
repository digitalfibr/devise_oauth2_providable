class RefreshRequest < ActiveRecord::Base
  include Devise::Oauth2Providable::ActiveRecord::RefreshToken
end
