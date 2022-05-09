Rails.application.routes.draw do
  get 'gossips/show'
  get 'gossips/index'
  get 'gossips/new'
  get 'static/team'
  get 'static/controller'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get 'bienvenue/:user_entry', to: 'gossips#index'
  get 'gossips/:id', to: 'gossips#show' , as: 'gossip'
  root to: 'gossips#index'
 
end
