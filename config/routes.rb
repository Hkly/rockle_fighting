Rails.application.routes.draw do
  root 'users#show'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    resources :rockles, only: [:new, :create]
  end
  resources :rockles, only: [:index, :show]

end
