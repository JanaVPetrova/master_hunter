require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(:default, Rails.env)

module MasterHunter
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.autoload_paths += %W(#{config.root}/lib)
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.i18n.default_locale = :ru
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.generators do |g|
      g.template_engine :haml
      g.helper false
      g.test_framework  :test_unit, fixture: true, fixture_replacement: :factory_girl
      g.stylesheets false
      g.javascripts false
    end
  end
end
