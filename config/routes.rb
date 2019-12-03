Rails.application.routes.draw do
  get 'home/index'
  resources :videos
  devise_for :users
  root 'home#index'
end
