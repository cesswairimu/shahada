Rails.application.routes.draw do


  get 'assignments/new'

  get 'lecturers/new'

  root              'static_pages#home'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :lecturers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
