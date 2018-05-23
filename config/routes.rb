Rails.application.routes.draw do
  root to: 'photos#index'
  resources :categories, only: [:index, :show]
  resources :photos
end
