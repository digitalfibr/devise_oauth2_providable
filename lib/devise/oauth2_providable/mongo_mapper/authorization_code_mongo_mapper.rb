module Devise
  module Oauth2Providable
    module ORMBehaviors
      module AuthorizationCodeMongoMapper
        def self.included base
          base.send :include, AuthorizationCode
        end
      end
    end
  end
end