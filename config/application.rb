require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module InstaClone
  class Application < Rails::Application  
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local   
    config.load_defaults 5.2
    config.generators do |g|
      g.assets false
      g.assets false    
    end
    #Dynamique Error 404 and 500
    config.exceptions_app = self.routes
    config.assets.initialize_on_precompile = false
  end
end
