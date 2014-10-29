require 'tilt'
require 'tilt/erb'
require 'helmet/templates'
require 'actn/api/template'
# require 'tilt/mustache'

Helmet::Templates.module_eval do
  
  alias_method :find_file_template, :find_template
  
  alias_method :erb_org, :erb
  
  def erb template, options = {}, locals = {}
    # template = "#{template.to_s}.erb"
    if tmpl = __find_template("#{template}.erb")
      erb_org :"" if tmpl.layout == "true"
      options[:layout] = tmpl.layout.to_sym unless tmpl.layout.nil?
      locals = tmpl.locals(template,params)
      # puts "tmpl #{tmpl.inspect} locals #{locals.inspect}"
      if tmpl.data_bind && tmpl.data_bind['required'] && locals.nil?
        status 404
        halt
      end
    end
    erb_org template, options, locals
  end
  
  private
  
  def find_template(engine, template)
    tmpl = __find_template("#{template.to_s}.#{engine.to_s}")
    return find_file_template(engine,template) unless tmpl
    tmpl.path
  end
  
  def __find_template filename
    __filename = filename
    if filename.include?("/") && filename.include?(".html")
      filename = filename.split("/").tap{|f| f[-1] = f[-1].gsub(/(.+)\./,'%.html.') }.join("/")
      filename = ["ilike", filename]
    end
    tmpl = Actn::Api::Template.find_by({'or' => {'filename' => [ "=", __filename ], 'filename' => filename}})
  end
  
end