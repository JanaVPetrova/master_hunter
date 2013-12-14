require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(:default, Rails.env)

module MasterHunter
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :haml
      g.helper false
      g.test_framework  :test_unit, fixture: true, fixture_replacement: :factory_girl
      g.stylesheets false
      g.javascripts false
    end
  end
end
