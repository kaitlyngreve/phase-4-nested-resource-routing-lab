class ItemsController < ApplicationController
# rescue_from ApplicationRecord::RecordNotFound, with: :render_not_found

  def index
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      items = user.items
    else
      items = Item.all
    end
      render json: items, include: :user
  end

  def show
    item = Item.find(params[:id])
    render json: item, status: :ok
  end

  def create
    user = User.find(params[:user_id])
    item = user.items.create(item_params)
    render json: item, status: :created
  end

  private

  def render_not_found
    render json: { error: "Item Not Found" }, status: :not_found
  end

  def item_params
    params.permit(:name, :description, :price)
  end
end
