Rails.application.routes.draw do
  authenticated :user do
    root to: 'groups#index', as: :authenticated_root
  end

  root to: 'users#index'
  resources :entities
  resources :groups do
    resources :transactions, only: %i[create destroy new edit update]
  end

  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
