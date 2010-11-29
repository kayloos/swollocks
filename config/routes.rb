Boersboss::Application.routes.draw do
  root :to => "pages#home"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :stocks, :only => [:new, :create, :destroy]
  resources :portfolios, :only => [:new, :edit, :create, :destroy]
  resources :stock_yanks, :only => [:show, :create, :destroy]

  match '/help'     => 'pages#help'
  match '/signup'   => 'users#new'
  match '/signin'   => 'sessions#new'
  match '/signout'  => 'sessions#destroy'
  match '/:controller(/:action(/:id))'
end
