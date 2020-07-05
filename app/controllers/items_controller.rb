class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # @image = @item.item_images.build
    @item.images.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    # if params[:item][:item_images_attributes] && @item.save!
    if @item.save!
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def show
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
              item_images_attributes: [:id, :item_id, :image_url])
      # .marge(user_id: current_user.id)
  end
end
