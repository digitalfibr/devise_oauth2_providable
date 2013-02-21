module Devise
  module Oauth2Providable
    module ActiveRecord
      module AuthorizationCode
        extend ActiveSupport::Concern
        
        included do
          class_eval do
            include Devise::Oauth2Providable::Behaviors::AuthorizationCode
          end
        end
      end
    end
  end
end