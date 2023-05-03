Rails.application.routes.draw do

  root to: "static_pages#index"
  

  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  get 'sair', to: 'sessions#sair'
  resources :sessions do 
    collection do
      get :sair
    end
  end
  


  resources :contacts
  resources :users, only: [:new, :create, :show]
 

  resources :users do
    resources :contacts, only: [:index]
    member do
      get 'contacts', to: 'users#contacts', as: 'user_contacts'
    end
  end

end