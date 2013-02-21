module Devise
  module Oauth2Providable
    module ActiveRecord
      module RefreshToken
        extend ActiveSupport::Concern
        
        included do
          class_eval do
            include Behaviors::RefreshToken
          end
        end
      end
    end
  end
end