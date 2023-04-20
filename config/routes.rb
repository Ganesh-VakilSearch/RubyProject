Rails.application.routes.draw do
  root 'home#index'
  resources :courses
  get 'welcome/index'
  get '/signup', to: 'home#signup'
  get '/login', to: 'home#login'
  post '/welcome/index', to: 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  scope '/admins' do
    get '/students', to: 'students#index', as: 'admins_students'
    resources :students, except: :index
  end
  # resources :students

  delete '/students/:id', to: 'students#destroy', as: 'delete_student'

  scope '/admins' do
    get '/courses', to: 'courses#index', as: 'admins_courses'
    resources :courses, except: :index
  end
end
