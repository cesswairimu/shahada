Rails.application.routes.draw do


  get 'questions/new'
  get 'assignments/new'

  get 'lecturers/new'

  root              'static_pages#home'
  get "stack" =>  'static_pages#stack'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :lecturers
  resources :questions
  resources :assignments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
