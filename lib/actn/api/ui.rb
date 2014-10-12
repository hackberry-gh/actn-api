require 'helmet'

module Actn
  module Api
    class UI < Helmet::API
  
  
      def self.inherited base

        base.init
        
        super
        
      end
          
    end
  end
end