Rails.application.routes.draw do
  resources :google_maps
  root to: "pages#index"
  get "/index", to:"pages#index"
  get "/quote", to:"pages#quote"
  get "/corporate", to:"pages#corporate"
  get "/residential", to:"pages#residential"
  get "/google_map", to: "pages#google_map"
  resources :quotes
  resources :leads
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

end
