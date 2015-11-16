Rails.application.routes.draw do
  resources :tags
  resources :image_users
  resources :images
  root "images#index"
  devise_for :users
  resources :images do
    resources :tags, :shallow => true
    resources :image_users, :shallwo => true
  end
end
