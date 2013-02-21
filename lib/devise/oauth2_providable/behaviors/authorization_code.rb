module Devise
  module Oauth2Providable
    module Behaviors
      module AuthorizationCode
        extend ActiveSupport::Concern
        
        included do
          class_eval do
            include Devise::Oauth2Providable::ExpirableToken            
            expires_according_to :authorization_code_expires_in
          end
        end
      end
    end
  end
end