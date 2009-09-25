require 'sinatra/base'

module Sinatra
  module Sassacache
    module Helpers
      def template?(name)
        return true if File.exists?(
          File.join(options.views || ".", name) + ".sass"
        )
        @template_keys ||= self.class.templates.keys.map {|k| k.to_s}
        @template_keys.include?(name)
      end
    end

    def self.registered(app)
      app.helpers Helpers
      app.set :sassacache_max_age, 2592000
      app.get "/:name.css" do |name|
        # This prevents a DOS by not turning any name to a symbol
        halt 404 if !template?(name)
        response["Cache-Control"] = "public, max-age=#{options.sassacache_max_age}"
        sass(name.to_sym)
      end
    end

  end

  register Sassacache
end
