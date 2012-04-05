class Devise::Oauth2Providable::RefreshToken < ActiveRecord::Base
  include Devise::Oauth2Providable::ORMBehaviors::RefreshTokenActiveRecord
end
