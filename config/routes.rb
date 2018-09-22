Rails.application.routes.draw do


  get 'questions/new'
  get 'logins/new'
  get 'assignments/new'
  get 'lecturers/new'

  root              'static_pages#home'
  get "stack" =>  'static_pages#stack'
  get    'log_in'  => 'sessions#new'
  post   'log_in'  => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get    'signin' => 'logins#new'
  post   'signin'  => 'logins#create'
  get 'signout' => 'logins#destroy'
  resources :users do
    member do
      get :activate_account
    end
  end
  resources :lecturers do
    member do
      get :activate_account
    end
  end
  resources :questions
  resources :assignments
  get "*path" => redirect("/")
end
