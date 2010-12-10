Boersboss::Application.routes.draw do
  get "yank_proposals/new"

  get "yank_proposals/create"

  get "yank_proposals/destroy"

  root :to => "pages#home"

  resources :users, :trades, :notes, :yank_proposals
  resources :sessions, :only => [:new, :create, :destroy]
  resources :stocks, :only => [:new, :create, :destroy]
  resources :portfolios, :only => [:index, :new, :edit, :create, :destroy]
  resources :stock_yanks, :only => [:index, :show, :create, :destroy]

  match '/help'     => 'pages#help'
  match '/signup'   => 'users#new'
  match '/signin'   => 'sessions#new'
  match '/signout'  => 'sessions#destroy'
  match '/:controller(/:action(/:id))'
end
