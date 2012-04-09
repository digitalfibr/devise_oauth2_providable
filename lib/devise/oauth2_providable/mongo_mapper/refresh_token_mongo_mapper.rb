module Devise
  module Oauth2Providable
    module ORMBehaviors
      module RefreshTokenMongoMapper
        def self.included base
          base.class_eval do
            include RefershTokenBase
          end
        end
      end
    end
  end
end