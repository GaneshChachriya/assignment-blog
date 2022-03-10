Rails.application.routes.draw do
    root "pages#home"
  resources :articles do
      resources :comments
  end
  get 'sign up', to: "users#new"
  resources :users, except: [:new]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  post 'logout', to: "sessions#destroy"
end
