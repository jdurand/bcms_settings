require 'browsercms'

module BcmsSettings
  class Engine < Rails::Engine
    include Cms::Module
    isolate_namespace BcmsSettings

    initializer 'bcms_settings', :after=>'disable_dependency_loading' do
      require 'bcms_settings/cms/settings'
      Cms::Settings.synchronize
    end
    
    initializer 'bcms_settings.route_extensions', :after => 'action_dispatch.prepare_dispatcher' do |app|
       ActionDispatch::Routing::Mapper.send :include, BcmsSettings::RouteExtensions
    end

    initializer 'bcms_settings.add_menu_item' do |app|
      app.config.cms.tools_menu << {
                    :menu_section => 'tools',
                    :name => 'Settings',
                    :engine => 'bcms_settings',
                    :route_name => 'general_settings_path'
                  }
    end
  end
end