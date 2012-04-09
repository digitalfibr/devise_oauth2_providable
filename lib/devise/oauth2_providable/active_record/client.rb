module Devise
  module Oauth2Providable
    module ActiveRecord
      module Client
        extend ActiveSupport::Concern
        
        def self.included base
          base.send :include, Behaviors::Client
        end
      end
    end
  end
end