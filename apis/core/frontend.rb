require 'actn/api/core'
require 'tilt/erb' 

class Frontend < Actn::Api::Core
  
  settings[:public_folder]  = "#{Actn::Api.root}/public"
  settings[:views_folder]   = "#{Actn::Api.root}/views"        
  
  helpers do
    
    def signin
      session[:user_uuid] = User.find_for_auth(data)
    end
    
    def signout
      session[:user_uuid] = nil
    end
    
    def query
      params['query']
    end
  
    def data
      params['data']
    end 
    
  end
  
  post "/signin" do
    content_type :json
    raise Goliath::Validation::Error(401,"Unauthorized") unless signin 
    OK
  end
  
  delete "/signout" do
    content_type :json
    signout 
    OK
  end
  
  get "*" do
    content_type :html
    erb :'core/app'
  end
  
end