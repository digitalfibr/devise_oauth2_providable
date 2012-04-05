module Devise
  module Oauth2Providable
    module ORMBehaviors
      module AuthorizationCodeActiveRecord
        def self.included base
          base.send :include, AuthorizationCodeBase
        end
      end
    end
  end
end