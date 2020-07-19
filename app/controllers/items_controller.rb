class ItemsController < ApplicationController
  def index
    @items = Item.all
    @images = Image.all
  end

  def new
  end

  def show
  end
end
