module Devise
  module Oauth2Providable
    module ActiveRecord
      module AccessToken
        extend ActiveSupport::Concern
        def self.included base
          base.send :include, Behaviors::AccessToken
        end
      end
    end
  end
end