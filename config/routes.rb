Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :create, :edit, :update, :delete]
  resources :events
  resources :comments, except: [:index]
  resources :categories, only: [:index, :show]
end
