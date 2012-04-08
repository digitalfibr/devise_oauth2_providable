class GrantAccessToken < ActiveRecord::Base
  include Devise::Oauth2Providable::ORMBehaviors::AccessTokenActiveRecord
end
