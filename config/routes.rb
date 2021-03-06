Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:new, :create, :show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
  resources :articles, only:[:new, :create, :show]
  resources :votes, only: [:create]
end


