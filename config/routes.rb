Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :mebles
  get 'zapiszsie', to: 'users#nowy'
  resources :users, except: [:nowy]
end
