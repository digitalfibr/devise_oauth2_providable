module Devise
  module Oauth2Providable
    module Behaviors
      module Client
        extend ActiveSupport::Concern
        
        module InstanceMethods

        private
          def init_app_identifier
            self.app_identifier = Devise::Oauth2Providable.random_id
          end
          def init_secret
            self.secret = Devise::Oauth2Providable.random_id
          end
        end
        
        def self.included base
          base.send :include, Devise::Oauth2Providable::ExpirableToken
          
          base.class_eval do
            has_many Devise::Oauth2Providable.ABSTRACT(:access_token_plur)
            has_many Devise::Oauth2Providable.ABSTRACT(:refresh_token_plur)
            has_many Devise::Oauth2Providable.ABSTRACT(:authorization_code_plur)

            before_validation :init_app_identifier, :on => :create, :unless => :app_identifier?
            before_validation :init_secret, :on => :create, :unless => :secret?
            validates :website, :secret, :presence => true
            validates :name, :presence => true, :uniqueness => true
            validates :app_identifier, :presence => true, :uniqueness => true

            attr_accessible :name, :website, :redirect_url

            include InstanceMethods
          end
        end
        
      end
    end
  end
end