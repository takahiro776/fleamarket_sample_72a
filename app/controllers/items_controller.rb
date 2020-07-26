class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_item, only: [:show, :destroy]
  before_action :set_user, only: [:show, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
    @images = Image.all
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if params[:item][:images_attributes] && @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def show
    @images = @item.images
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item)
          .permit(:name,
                  :description,
                  :brand,
                  :category_id,
                  :condition,
                  :delivery_fee,
                  :delivery_regions,
                  :shipping_schedule,
                  :price,
                  images_attributes: [:image_url, :id, :_destroy])
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @users = User.find(@item.user_id)
  end
end
