Rails.application.routes.draw do
	root 	 'sessions#index'
  get  	 '/login',  to: 'sessions#new'
  post 	 '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  resources :users
  resources :posts
end