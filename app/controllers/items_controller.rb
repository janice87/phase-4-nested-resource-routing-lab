class ItemsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

# Nested Items Index Route
# GET /users/:user_id/items
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else   
    items = Item.all
    end
    render json: items, include: :user
  end

# Nested Item Show Route
# GET /users/:user_id/items/:id
# no change bc we are rendering a single item, regardless of how it was accessed
  def show   
    item = Item.find(params[:id]) # just id bc that is the primay key??
    render json: item
  end

# Nested Item Create Route
# POST /users/:user_id/items
  def create    
    user = User.find(params[:user_id])
    item = user.items.create(items_params)
    render json: item, status: :created    
  end

  private
  def render_not_found
    render json: {error: "Record not found"}, status: :not_found
  end

  def items_params
    params.permit(:name, :price, :description)
  end
end
