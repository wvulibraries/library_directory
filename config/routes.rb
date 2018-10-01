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

  # search
  get '/search',
      to: 'search#index',
      as: 'search_index'

  # admin
  get '/admin',
      to: 'admin#home',
      as: 'admin_home'

  # admin namespaces for crud tasks
  namespace :admin do
    resources :buildings,
              :departments,
              :employees,
              :floors,
              :subjects,
              :service_points
  end
end