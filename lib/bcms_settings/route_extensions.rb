module BcmsSettings::RouteExtensions
  def mount_bcms_settings
    mount BcmsSettings::Engine => "/settings", :as => "bcms_settings"
  end
  
  alias :routes_for_bcms_settings :mount_bcms_settings
end
