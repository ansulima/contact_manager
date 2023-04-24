Rails.application.routes.draw do
  resources :contacts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "static_pages#index"
  

  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'

end