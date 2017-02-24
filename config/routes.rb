Localizator::Engine.routes.draw do
  get '/' => 'locales#index', as: :locales
  put '/' => 'locales#update', as: :update_locales
end

Rails.application.routes.draw do
  mount_localizator_routes
end
