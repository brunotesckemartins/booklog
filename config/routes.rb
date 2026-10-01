Rails.application.routes.draw do
  get "collections/index"
  get "collections/show"
  get "collections/new"
  get "collections/edit"
  get "public/show"
  devise_for :users
  root "items#index"
  resources :items
  resources :collections 
  get "/p/:token", to: "public#show", as: :public_item
end