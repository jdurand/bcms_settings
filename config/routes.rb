BcmsSettings::Engine.routes.draw do
  get '/general' => 'settings#index', :as => :general_settings
  post '/general/add' => 'settings#add'
  post '/general/remove/:key' => 'settings#remove'
end