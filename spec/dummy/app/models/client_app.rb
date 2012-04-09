class ClientApp < ActiveRecord::Base
  include Devise::Oauth2Providable::ActiveRecord::Client
end
