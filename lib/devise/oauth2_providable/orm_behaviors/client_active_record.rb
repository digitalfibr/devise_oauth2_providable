module Devise
  module Oauth2Providable
    module ORMBehaviors
      module ClientActiveRecord
        def self.included base
          base.send :include, ClientBase
        end
      end
    end
  end
end