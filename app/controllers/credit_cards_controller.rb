class CreditCardsController < ApplicationController

  require "payjp"

  def new
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.create(
      card: params[:card_token],
      metadata: {user_id: current_user.id}
    )
    @card = CreditCard.new(
      card_id: customer.default_card,
      customer_id: customer.id,
      user_id: current_user.id
    )
    if @card.save
      redirect_to action: "show",  id: @card.user_id
    else
      redirect_to action: "new"
    end
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    # card = CreditCard.where(user_id: current_user.id).first
    # if card.blank?
    #   redirect_to action: "new" 
    # else
    #   Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #   customer = Payjp::Customer.retrieve(card.customer_id)
    #   @default_card_information = customer.cards.retrieve(card.card_id)
    # end
  end

  # def deleate #顧客データの削除
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #   else
  #     Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     customer.delete
  #     card.delete
  #   end
  #   redirect_to action: "new"
  # end

end
