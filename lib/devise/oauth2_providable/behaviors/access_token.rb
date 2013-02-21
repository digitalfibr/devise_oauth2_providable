module Devise
  module Oauth2Providable
    module Behaviors
      module AccessToken
        extend ActiveSupport::Concern

        included do
          class_eval do
            include Devise::Oauth2Providable::ExpirableToken

            expires_according_to :access_token_expires_in

            before_validation :restrict_expires_at, :on => :create, :if => :refresh_token
            belongs_to Devise::Oauth2Providable.ABSTRACT(:refresh_token_sym)
          end
        end

        def token_response
          response = {
            :access_token => token,
            :token_type => 'bearer',
            :expires_in => expires_in
          }
          response[:refresh_token] = refresh_token.token if refresh_token
          response
        end
          
        # dynamic accessor :
        # low perf
        # but flexible
        # should be replaced by meta prog
        def refresh_token
          send Devise::Oauth2Providable.ABSTRACT(:refresh_token_sym)
        end

        private
        def restrict_expires_at
          self.expires_at = [self.expires_at, refresh_token.expires_at].compact.min
        end
      end
    end
  end
end