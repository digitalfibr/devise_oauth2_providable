class Devise::Oauth2Providable::AccessToken < ActiveRecord::Base
  include Devise::Oauth2Providable::ORMBehaviors::AccessTokenActiveRecord
end
