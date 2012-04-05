module Devise
  module Oauth2Providable
    module ORMBehaviors
      module RefreshTokenBase
        def self.included base
          base.class_eval do
            expires_according_to :refresh_token_expires_in

            has_many :access_tokens
          end
        end
      end
    end
  end
end