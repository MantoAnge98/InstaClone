require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module InstaClone
  class Application < Rails::Application  
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    I18n.config.enforce_available_locales = true
    I18n.config.available_locales = :ja
    I18n.config.default_locale = :ja
    
    config.load_defaults 5.2
    config.generators do |g|
      g.assets false
      g.assets false    
    end
    config.exceptions_app = self.routes
    config.assets.initialize_on_precompile = false
  end
end
