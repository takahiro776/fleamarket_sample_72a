class CreditCardsController < ApplicationController
  before_action :set_card, only: [:show, :delete]
  require "payjp"


  def new
    gon.payjp_public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def brandnew
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
      redirect_to action: "show", id: @card.user_id
      flash[:notice] = "カードの登録が完了しました"
    else
      render :new
    end
  end

  def show 
    if @creditcard.blank?
      redirect_to action: "brandnew" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@creditcard.customer_id)
      @card_info = customer.cards.retrieve(@creditcard.card_id)
    end
  end

  def delete
    if @creditcard.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@creditcard.customer_id)
      @creditcard.delete
      customer.delete
    end
    redirect_to action: "show"
    flash[:notice] = "カード情報を削除しました"
  end

  private
  def set_card
    @creditcard = CreditCard.where(user_id: current_user.id).last
  end
end
