Rails.application.routes.draw do


  get 'questions/new'

  get 'lecturers/new'

  root              'static_pages#home'
  get "stack" =>  'static_pages#stack'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :lecturers
  resources :questions
end
