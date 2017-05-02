Rails.application.routes.draw do


  get 'logins/new'

  get 'assignments/new'

  get 'lecturers/new'

  root              'static_pages#home'
  get    'log_in'  => 'sessions#new'
  post   'log_in'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get    'signin' => 'logins#new'
  post   'signin'  => 'logins#create'
  delete 'signout' => 'logins#destroy'
   resources :users
  resources :lecturers
  resources :assignments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
