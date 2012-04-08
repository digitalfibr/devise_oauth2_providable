module Devise
  module Oauth2Providable
    module ORMBehaviors
      module RefreshTokenBase
        extend ActiveSupport::Concern
        
        def self.included base
          base.class_eval do
            expires_according_to :refresh_token_expires_in

            has_many Oauth2Providable.ABSTRACT(:access_token_plur)
          end
        end
      end
    end
  end
end