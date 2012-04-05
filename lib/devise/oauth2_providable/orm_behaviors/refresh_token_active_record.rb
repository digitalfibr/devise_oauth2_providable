module Devise
  module Oauth2Providable
    module ORMBehaviors
      module RefreshTokenActiveRecord
        def self.included base
          base.class_eval do
            include RefreshTokenBase
          end
        end
      end
    end
  end
end