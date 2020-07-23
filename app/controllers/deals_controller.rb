class DealsController < ApplicationController
  before_action :set_item, :set_card

  require "payjp"

  def show
    if @setcard.blank?
      redirect_to new_credit_card_path, alert:"商品購入にはクレジットカード登録が必要です"
    else
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(@setcard.customer_id)
    @card = customer.cards.retrieve(@setcard.card_id) 
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    customer: @setcard.customer_id,
    currency: 'jpy',
    capture: 'false'
    )
    deal = Deal.new(user_id: current_user.id, item_id: @item.id )
    if deal.save
      charge.capture
      redirect_to root_path, notice:"購入が完了しました"
    else
      redirect_to deal_path, alert: "購入に失敗しました"
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @setcard = CreditCard.where(user_id: current_user.id).last
  end
end