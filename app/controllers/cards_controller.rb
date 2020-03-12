class CardsController < ApplicationController
  before_action :get_payjp_info, only: [:new_create, :create, :delete, :show]

  def edit
  end

  def create
    if params['payjp-token'].blank? #カードにデータが入っていないなら
      redirect_to action: "edit", id: current_user.id
    else
      customer = Payjp::Customer.create(
      email: current_user.email, 
      card: params['payjp-token'],
      metadata: {user_id: current_user.id} 
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card) 
      if @card.save
        redirect_to card_path(current_user)
      else
        redirect_to action: "edit", id: current_user.id
      end
    end
  end

  def delete
    card = current_user.cards.first #ログインユーザーのカードテーブルの最初の要素を取り出す
    if card.present? #カードにデータが入っているなら
      customer = Payjp::Customer.retrieve(card.customer_id) #顧客情報の取得
      customer.delete
      card.delete
    end
      redirect_to user_path(current_user)
  end

  def show
    card = current_user.cards.first
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    else
      redirect_to controller: :user, action: "users", id: current_user.id
    end
  end

  def confirmation
    card = current_user.cards 
    redirect_to action: "show" if card.exists?
  end

  private

  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
    end
  end

end
