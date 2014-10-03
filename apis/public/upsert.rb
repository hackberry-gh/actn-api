require 'actn/api/public'

class Upsert < Actn::Api::Public
  
  use Goliath::Rack::Validation::RequestMethod, %w(GET POST PUT PATCH OPTIONS)
  
  ##
  # POST /table_name
  
  def process table, path
    data['path'] = path
    puts data.inspect
    Actn::DB::Set[table].validate_and_upsert(data)
  end
  
end