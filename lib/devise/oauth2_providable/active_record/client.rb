module Devise
  module Oauth2Providable
    module ActiveRecord
      module Client
        extend ActiveSupport::Concern
        
        included do
          class_eval do
            include Behaviors::Client
          end
        end
      end
    end
  end
end