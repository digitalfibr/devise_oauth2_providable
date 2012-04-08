require 'devise/models'

module Devise
  module Models
    module Oauth2Providable
      extend ActiveSupport::Concern
      included do
        has_many(
          Devise::Oauth2Providable.ABSTRACT(:access_token_plur),
          :class_name => Devise::Oauth2Providable.ABSTRACT(:access_token).to_s
        )
        has_many(
          Devise::Oauth2Providable.ABSTRACT(:authorization_code_plur),
          :class_name =>  Devise::Oauth2Providable.ABSTRACT(:authorization_code).to_s
        )
      end
    end
  end
end
