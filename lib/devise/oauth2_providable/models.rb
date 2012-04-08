module Devise
  module Oauth2Providable
    # This module provide model abstraction service
    #
    # It generate for all Abstract Names attr_readers : 
    # * ABSTRACTT => model
    # * ABSTRACTT_sym => symbole
    # * ABSTRACTT_plur => 
    # It's really tricky using meta programming
    # A more solid system should be implemented
    class Models
      ABSTRACTT_NAMES = [:access_token, :authorization_code, :client, :refresh_token]
      
      # meta generate referined accessor
      ABSTRACTT_NAMES.each do |abstract|
        # define symbole accessor
        sym_method = "#{abstract}_sym".to_sym
        attr_accessor sym_method
        
        # dynamic auto cache model class accessor
        define_method abstract do
          eval "@#{abstract} ||= model_for_sym(send sym_method)"
        end
        
        # dynamic auto cache pluralized symbole accessor
        define_method "#{abstract}_plur".to_sym do
          eval "@#{abstract}_plur ||= (send sym_method).to_s.pluralize.to_sym"
        end
        
        # dynamic auto cache pluralized symbole accessor
        define_method "#{abstract}_sym_id".to_sym do
          eval "@#{abstract}_sym_id ||= (send(sym_method).to_s + '_id').to_sym"
        end
      end
      
      # Fill *_class field with default class if it exist
      def initialize
        ABSTRACTT_NAMES.each do |abstract|
          # affect basic symbole
          send "#{abstract}_sym=".to_sym, abstract
        end
      end
      
    protected
      # Try to load model_sym as class
      # If class does not exist, it return nil
      def model_for_sym model_sym
        begin
          # The following case do not append
          # "SSLError".underscore.camelize # => "SslError"
          model = model_sym.to_s.camelize.constantize
        rescue Exception => e
          puts "model_sym exceptioin : #{e.message}"
          # Nothing to do, we failed to load constant
        end
        model
      end
    end
  end
end