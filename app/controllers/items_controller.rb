class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
    # @images = Image.all
  end

  def new
    @item = Item.new
    @item.images.new
    @categories = Category.where(ancestry: nil)
  end

  def create
    @item = Item.new(item_params)
    if params[:item][:images_attributes] && @item.save
      redirect_to root_path
    else
      @item.images.new
      @categories = Category.where(ancestry: nil)
      render :new
    end
  end

  def show
    @images = @item.images
    @grandchild = @item.category
    @parent = @item.category.root
    @children = @grandchild.parent
  end

  def edit
    @item.images.new
  end

  def update
    @category = @item.category_id
    if @item.update(item_params) 
      redirect_to item_path
    elsif item_params[:images_attributes] == ""
      flash.now[:alert] = '変更できませんでした 【画像を１枚以上入れてください】'
      render :edit
    else item_params[:category_id].blank?
      flash.now[:alert] = '変更できませんでした 【カテゴリーを選択してください】'
      @item.category_id = @category
      render :edit
    end
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
    @user = User.find(@item.user_id)
  end
end
