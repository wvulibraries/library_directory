Rails.application.routes.draw do
  # home index
  root to: 'application#home'
  get '/home', to: 'application#home', as: 'home'

  # admin panel
  namespace :admin do
    resources :buildings
  end

end
