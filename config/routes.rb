Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :mebles
  get 'zapiszsie', to: 'users#nowy'
  resources :users, except: [:nowy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, expect: [:destroy]
end
