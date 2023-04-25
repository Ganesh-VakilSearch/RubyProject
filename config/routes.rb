Rails.application.routes.draw do
  devise_for :admin_users

  root 'home#index'
  resources :courses
  get 'welcome/index'
  get 'admin/index'
  get '/signout', to: 'admin#signout'
  get '/login', to: 'home#login'
  post '/welcome/index', to: 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  resources :students

  delete '/students/:id', to: 'students#destroy', as: 'delete_student'
  get 'students/by_dept/:department', to: 'students#by_dept', as: 'by_dept_student'
  devise_scope :admin_user do
    delete 'admin_users/sign_out', to: 'devise/sessions#destroy'
  end
  scope '/admins' do
    get '/courses', to: 'courses#index', as: 'admins_courses'
    resources :courses, except: :index
  end
end
