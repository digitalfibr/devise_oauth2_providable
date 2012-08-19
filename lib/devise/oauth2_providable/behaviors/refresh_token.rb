module Devise
  module Oauth2Providable
    module Behaviors
      module RefreshToken
        extend ActiveSupport::Concern
        
        def self.included base
          base.send :include, Devise::Oauth2Providable::ExpirableToken
          
          base.class_eval do
            expires_according_to :refresh_token_expires_in

            has_many Devise::Oauth2Providable.ABSTRACT(:access_token_plur)
          end
        end
      end
    end
  end
end