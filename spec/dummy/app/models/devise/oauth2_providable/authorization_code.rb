class Devise::Oauth2Providable::AuthorizationCode < ActiveRecord::Base
  include Devise::Oauth2Providable::ORMBehaviors::AuthorizationCodeActiveRecord
end
