module Devise
  module Oauth2Providable
    module ActiveRecord
      module RefreshToken
        extend ActiveSupport::Concern
        
        def self.included base
          base.class_eval do
            include Behaviors::RefreshToken
          end
        end
      end
    end
  end
end