module Devise
  module Oauth2Providable
    module ORMBehaviors
      module AccessTokenActiveRecord
        def self.included base
          base.send :include, AccessTokenBase
        end
      end
    end
  end
end