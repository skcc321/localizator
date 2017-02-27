Localizator::Engine.routes.draw do
  get '/' => 'locales#index', as: :locales
  post '/update' => 'locales#update', as: :update_locales
  get '/download' => 'locales#download', as: :download_locales
  get '/reload' => 'locales#reload', as: :reload_locales
end

Rails.application.routes.draw do
  mount_localizator_routes
end
