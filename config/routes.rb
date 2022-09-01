Rails.application.routes.draw do
  resources :items, only: [:index, :show, :create]
  resources :users, only: [:show] do
    resources :items, only: [:show, :index, :create]
  end
end
