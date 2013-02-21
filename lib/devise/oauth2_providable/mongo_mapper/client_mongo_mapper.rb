module Devise
  module Oauth2Providable
    module ORMBehaviors
      module ClientMongoMapper
        extend ActiveSupport::Concern
        included do
          class_eval do
            include ClientBase
          end
        end
      end
    end
  end
end