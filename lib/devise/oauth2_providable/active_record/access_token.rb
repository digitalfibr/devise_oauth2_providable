module Devise
  module Oauth2Providable
    module ActiveRecord
      module AccessToken
        extend ActiveSupport::Concern
        included do
          class_eval do
            include Behaviors::AccessToken
          end
        end
      end
    end
  end
end