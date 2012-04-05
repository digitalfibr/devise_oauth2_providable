module Devise
  module Oauth2Providable
    module ORMBehaviors
      module AuthorizationCodeBase
        def self.included base
          base.class_eval do
            expires_according_to :authorization_code_expires_in
          end
        end
      end
    end
  end
end