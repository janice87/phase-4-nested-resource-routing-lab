Rails.application.routes.draw do
  resources :items, only: [:index]

  resources :users, only: [:show] do 
    resources :items, only: [:index, :show, :create]
  end
end

# Nested Items Index Route
# GET /users/:user_id/items

# Nested Item Show Route
# GET /users/:user_id/items/:id

# Nested Item Create Route
# POST /users/:user_id/items