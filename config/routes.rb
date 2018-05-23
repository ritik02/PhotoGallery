Rails.application.routes.draw do
  root to: 'photos#index'
  resources :categories
  resources :photos
end
