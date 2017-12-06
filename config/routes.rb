Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index]
  resources :events
  resources :comments, except: [:index, :new]
  resources :categories, only: [:index, :show]
  post '/events/:id', to: "comments#create"
end
