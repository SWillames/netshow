Rails.application.routes.draw do
  namespace :backstage do
    get 'welcome/index'
  end
  get 'home/index'
  resources :videos
  devise_for :users
  root 'home#index'
end
