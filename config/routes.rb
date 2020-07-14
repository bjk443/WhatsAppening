Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  root to: 'venues#index'
  resources :venues do
    resources :chatrooms, only: :show
    resources :messages, only: :create
    resources :events do
      resources :ratings, only: :create
    end
  end
    get "/my_venues", to: "venues#my_venues"
end
