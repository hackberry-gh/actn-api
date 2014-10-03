require 'actn/api/public'
require 'actn/core_ext/string'
require 'goliath/rack/templates' 
require 'tilt/erb' 

class Connect < Actn::Api::Public
    
  include Goliath::Rack::Templates  
  
  ##
  # GET /connect.js, renders actn.io js api client
  
  def response(env)
    authorize!
    
    [
      200, CT_JS, erb(:'public/connect', {}, { 
      
      host: env['HTTP_HOST'],       apikey: query['apikey'], 
      
      csrf: Rack::Csrf.token(env),  ttl: Client::TTL * 1000 
      
      } ) 
    ]
  end
  
  private
  
  def authorize!
    begin
      puts env['HTTP_REFERER'].to_domain, query['apikey']
      client = Client.find_for_auth(env['HTTP_REFERER'].to_domain, query['apikey'])
      puts "CLIENT #{client.inspect}"
      client.set_session env['rack.session'].id
    rescue
      raise Goliath::Validation::UnauthorizedError.new
    end
  end
  
end