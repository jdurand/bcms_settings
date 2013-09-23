class BcmsSettings::SettingsController < Cms::BaseController

  layout 'cms/administration'
  check_permissions :administrate

  before_filter :init_config

  def index

  end

  def add
    unless params[:key] == ""
      unless params[:val] == ""
        @config.set(params[:key], params[:val])
      else
        @config.delete(params[:key])
      end
    end
    redirect_to general_settings_url
  end

  def remove

    redirect_to general_settings_url
  end

  private

    def init_config
      @menu_section = 'tools'
      Cms::Settings.register "bcms_general_settings" unless Cms::Settings.modules.include? "bcms_general_settings"
      @config = Cms::Settings.bcms_general_settings
    end
end