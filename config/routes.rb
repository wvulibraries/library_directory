Rails.application.routes.draw do
  # home index
  root to: 'application#home'

  get '/home',
      to: 'application#home',
      as: 'home'

  # auth
  get '/login',
      to: 'application#login',
      as: 'login'

  get '/logout',
      to: 'application#logout',
      as: 'logout'

  # buildings
  get '/buildings',
      to: 'buildings#list',
      as: 'building_list'

  get '/buildings/:id/employees',
      to: 'buildings#employees',
      as: 'building_employees'

  get '/buildings/:id',
      to: 'buildings#details',
      as: 'building_details'

  # employees
  get 'employees',
      to: 'employees#list',
      as: 'employee_list'

  get '/employee/:id',
      to: 'employees#profile',
      as: 'employee_profile'

  # departments
  get 'departments',
      to: 'department#list',
      as: 'department_list'

  get 'departments/:id',
      to: 'department#details',
      as: 'department_details'

  get 'departments/:id/employees',
      to: 'department#employees',
      as: 'department_employees'

  # liaisons
  get '/liaisons',
      to: 'liaison#list',
      as: 'liaisons_list'
  get '/subjects', to: redirect('/liaisons', status: 302)

  # search
  get '/search',
      to: 'search#index',
      as: 'search_index'

  # admin
  get '/admin',
      to: 'admin#home',
      as: 'admin_home'

  # phone lists
  get '/phonelist/morgantown', to: 'phone_list#morgantown'
  get '/phonelist/all', to: 'phone_list#all'

  # API
  namespace :api do
    namespace :v1, defaults: { format: :json } do
        # buildings
        get '/buildings/:id/employees', to: 'buildings#employees'
        get '/buildings/:id', to: 'buildings#details'
        get '/buildings', to: 'buildings#list'

        # departments
        get '/departments', to: 'departments#list'
        get '/departments/:id', to: 'departments#details'
        get '/departments/:id/employees', to: 'departments#employees'
        
        # employees
        get 'employees', to: 'employees#list'
        get 'employees/:id', to: 'employees#profile'
    end
  end

  # admin namespaces for crud tasks
  namespace :admin do
    resources :buildings,
              :departments,
              :employees,
              :floors,
              :subjects,
              :service_points

    resources :employees do
      resources :leadership, only: [:index, :edit, :update, :destroy]
    end
  end
end