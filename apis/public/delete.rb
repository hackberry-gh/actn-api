require 'actn/api/public'
 
class Delete < Actn::Api::Public
  
  use Goliath::Rack::Validation::RequestMethod, %w(DELETE OPTIONS)
  
  ##
  # GET /table_name?query={ where: { uuid: 1 } }
  
  def process table, path
    
    Actn::DB::Set[table].delete({uuid: query['uuid']})
  end
  
end