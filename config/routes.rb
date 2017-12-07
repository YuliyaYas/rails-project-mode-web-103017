Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index]
  resources :events
  resources :comments, except: [:index, :new]
  resources :categories, only: [:index, :show]
  post '/events/:id', to: "comments#create"
  get '/events/:id/attendants', to: "events#attendants", as: "event_attendants"
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  get '/add_attendant/:id', to: "events#user_attend", as: "user_attend"
  post '/login', to: "sessions#create"
  post '/sessions', to: "sessions#create", as: "sessions"
  get '/logout', to: "sessions#destroy", as: "logout"
  get '/users/:id/events', to: "users#events", as: "user_events"
  get '/users/categories/:id', to: "users#favorite", as: "favorites"
end
