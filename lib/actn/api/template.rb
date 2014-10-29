require 'actn/db/mod'
require 'actn/core_ext/string'
require 'tempfile'
module Actn
  module Api
    class Template < DB::Mod
      self.table = "templates"
      self.schema = "core" 
      
      data_attr_accessor :filename, :body, :layout, :data_bind
  
      validates_presence_of :filename, :body
      
      def locals path, params
        return unless data_bind
        @locals ||= begin
          slug = File.basename(path).split("/")[-1].split(".")[0]          
          eparams = eval(data_bind['query']['params'])
          if (data = Actn::DB::Set[data_bind['table_name']].send(data_bind['query']['action'],eparams)) != ""
            # puts "DATA #{data.inspect}"
            {data: Oj.load(data)}
          end
        rescue Exception => e
          puts "Template#locals Exception #{e.inspect}"
          nil
        end
      end
      
      def path
        @path ||= begin
          parts = filename.split(".")
          file = Tempfile.new([parts[1..-2].join("."),".#{parts.last}"])
          file.write(self.body)
          file.rewind
          file.close          
          file.path
        end
      end
       
    end
  end
end