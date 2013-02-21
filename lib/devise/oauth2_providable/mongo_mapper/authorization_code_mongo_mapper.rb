module Devise
  module Oauth2Providable
    module ORMBehaviors
      module AuthorizationCodeMongoMapper
        extend ActiveSupport::Concern
        included do
          class_eval do
            include AuthorizationCode
          end
        end
      end
    end
  end
end