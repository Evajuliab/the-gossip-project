
Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  get 'comments/create'
  get 'cities/show'
  
#   get 'gossips/show'
#   get 'gossips/index'
#   get 'gossips/new'
    get 'static/team'
#   get 'static/controller'
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"

  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get 'bienvenue/:user_entry', to: 'gossips#index'
#   get 'gossips/:id', to: 'gossips#show' , as: 'gossip'
root to: 'gossips#index'
 get '/user/:id' , to: 'users#show', as: 'user'




resources :users

post "/signin", to: "sessions#create", as: "signin"
get '/signin', to: "sessions#new"
get '/logout', to: 'sessions#destroy'

resources :gossips do
  resources :comments
end


resources :cities

end

