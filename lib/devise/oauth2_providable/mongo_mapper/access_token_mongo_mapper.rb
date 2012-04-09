module Devise
  module Oauth2Providable
    module ORMBehaviors
      module AccessTokenMongoMapper
        def self.included base
          base.send :include, AccessTokenBase
          
          # Add keys
        end
      end
    end
  end
end