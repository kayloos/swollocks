Swollocks::Application.routes.draw do
  devise_for :users

  get "yank_proposals/new"

  get "yank_proposals/create"

  get "yank_proposals/destroy"

  root :to => "pages#front"

  resources :trades, :notes, :yank_proposals, :stock_yanks
  resources :stocks, :only => [:new, :create, :destroy]
  resources :portfolios, :only => [:index, :new, :edit, :create, :destroy]

  match '/help'     => 'pages#help'
  match '/:controller(/:action(/:id))'
end
