class TransactionController < ApplicationController
  before_action :set_item

  require "payjp"

  def show
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    card = CreditCard.where(user_id: current_user.id).last
    customer = Payjp::Customer.retrieve(card.customer_id)
    @card = customer.cards.retrieve(card.card_id)
  end

  def pay
    card = CreditCard.where(user_id: current_user.id).last
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => card.customer_id,
    :currency => 'jpy',
    )
    redirect_to action: 'done' #完了画面に移動
  end

  def done
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

end
