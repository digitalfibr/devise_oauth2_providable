module Devise
  module Oauth2Providable
    module ActiveRecord
      module AuthorizationCode
        extend ActiveSupport::Concern
        
        def self.included base
          base.send :include, Devise::Oauth2Providable::Behaviors::AuthorizationCode
        end
      end
    end
  end
end