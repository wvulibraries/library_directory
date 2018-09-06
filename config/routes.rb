Rails.application.routes.draw do
  # home index
  root to: 'application#home'
  get '/home', to: 'application#home', as: 'home'

  # auth
  get '/login', to: 'application#login', as: 'login'
  get '/logout', to: 'application#logout', as: 'logout'

  # public
  get '/buildings', to: 'buildings#list', as: 'building_list'
  get '/buildings/:id/employees', to: 'buildings#employees', as: 'building_employees'
  get '/buildings/:id', to: 'buildings#details', as: 'building_details'

  # admin
  get '/admin', to: 'admin#home', as: 'admin_home'

  # admin namespaces for crud tasks
  namespace :admin do
    resources :buildings, :departments, :employees, :floors, :subjects, :service_points
  end
end