module Devise
  module Oauth2Providable
    module ORMBehaviors
      module RefreshTokenMongoMapper
        extend ActiveSupport::Concern
        included do
          class_eval do
            include RefershTokenBase
          end
        end
      end
    end
  end
end