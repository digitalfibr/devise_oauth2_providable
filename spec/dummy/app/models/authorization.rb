class Authorization < ActiveRecord::Base
  include Devise::Oauth2Providable::ORMBehaviors::AuthorizationCodeActiveRecord
end
