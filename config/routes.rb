Rails.application.routes.draw do
  resources :graphs
  root to: "pages#index"
  get "/index", to:"pages#index"
  get "/quote", to:"pages#quote"
  get "/corporate", to:"pages#corporate"
  get "/residential", to:"pages#residential"
  get "/polly", to:"pages#polly"
  resources :quotes
  resources :leads
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get "dataoutput.mp3"
  devise_for :users
end
