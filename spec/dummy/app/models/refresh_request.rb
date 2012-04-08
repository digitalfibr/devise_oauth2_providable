class RefreshRequest < ActiveRecord::Base
  include Devise::Oauth2Providable::ORMBehaviors::RefreshTokenActiveRecord
end
