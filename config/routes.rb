Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/s", to: "venues#search"
  resources :venues
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
