module ModelAbstraction
  extend ActiveSupport::Concern

  included do
    class_eval do
      include SharedMethods
      extend SharedMethods
    end
  end

  module SharedMethods
    def ABSTRACT meth=nil
      if meth
        ::Devise::Oauth2Providable.models.send meth
      else
        ::Devise::Oauth2Providable.models
      end
    end
  end
end

include ModelAbstraction

#puts ModelAbstraction::SharedMethods.ABSTRACT
#puts ABSTRACT()