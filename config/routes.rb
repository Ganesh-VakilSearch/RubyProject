Rails.application.routes.draw do
  root 'home#index'
  resources :courses
  get 'welcome/index'
  get '/signup', to: 'home#signup'
  get '/login', to: 'home#login'
  post '/welcome/index', to: 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  resources :students
  delete '/students/:id', to: 'students#destroy', as: 'delete_student'
end
