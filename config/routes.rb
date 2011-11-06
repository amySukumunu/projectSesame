ProjectSesame::Application.routes.draw do
  resources :users do 
	resources :microposts
  end
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:new, :create, :destroy]
  
  root :to => 'pages#home'
  match '/contact', 	:to => 'pages#contact'
  match '/about',   	:to => 'pages#about'
  match '/blog',     	:to => 'microposts#index'
  match '/signup',   	:to => 'users#new'
  match '/signin',   	:to => 'sessions#new'
  match '/signout',   	:to => 'sessions#destroy'
  match '/newpost',   	:to => 'microposts#new'
  match "/microposts/:id"  => "microposts#show"
  match "/users/:id"  => "users#show"
  
end
