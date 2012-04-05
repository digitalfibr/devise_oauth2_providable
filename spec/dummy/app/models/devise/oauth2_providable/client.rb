class Devise::Oauth2Providable::Client < ActiveRecord::Base
  include Devise::Oauth2Providable::ORMBehaviors::ClientActiveRecord
end
