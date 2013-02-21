module Devise
  module Oauth2Providable
    module ORMBehaviors
      module AccessTokenMongoMapper
        extend ActiveSupport::Concern
        included do
          class_eval do
            include AccessTokenBase

            # Add keys
          end
        end
      end
    end
  end
end