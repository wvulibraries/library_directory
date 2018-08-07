Rails.application.routes.draw do
  # home index
  root to: 'application#home'
  get '/home', to: 'application#home', as: 'home'

  # auth
  get '/login', to: 'application#login', as: 'login'
  get '/logout', to: 'application#logout', as: 'logout'

  # admin
  get '/admin', to: 'admin#home', as: 'admin_home'

  # admin namespaces for crud tasks
  namespace :admin do
    resources :buildings, :departments, :employees, :floors, :subjects
  end
end