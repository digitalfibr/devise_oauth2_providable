module Devise
  module Oauth2Providable
    module Behaviors
      module RefreshToken
        extend ActiveSupport::Concern
        
        included do
          class_eval do
            include Devise::Oauth2Providable::ExpirableToken

            expires_according_to :refresh_token_expires_in

            has_many Devise::Oauth2Providable.ABSTRACT(:access_token_plur)
          end
        end
      end
    end
  end
end