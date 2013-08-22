Assassin::Application.routes.draw do
  resources :games
  resources :players, only: [:create, :update, :destroy]

  root :to => 'games#index'
end
