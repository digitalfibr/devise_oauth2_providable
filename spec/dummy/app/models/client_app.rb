class ClientApp < ActiveRecord::Base
  include Devise::Oauth2Providable::ORMBehaviors::ClientActiveRecord
end
