Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :venues do
    resources :events
    resources :chatrooms, only: :show
    resources :messages, only: :create
  end
end
