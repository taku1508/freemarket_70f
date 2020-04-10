class CardsController < ApplicationController
  before_action :current_user_blank?
  before_action :get_payjp_info, only: [:create, :delete, :show, :buy]

  def edit
  end

  def create
    if params['payjp-token'].blank? #カードにデータが入っていないなら
      redirect_to action: "edit", id: current_user.id
    else
      customer = Payjp::Customer.create( #payjpAPIにクレジットカード情報を登録する記述
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
    else
      redirect_to user_path(current_user)
    end
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
    redirect_to action: "show"if card.exists?
  end

  def buy
    card = current_user.cards 
    # address = current_user.address
    @item = Item.find(params[:id])
    if @item.soldout == 1
      redirect_to item_path(@item.id)
      flash[:alert] = '既に購入されています。'
    elsif card.blank?
      redirect_to action: "edit", id: current_user.id
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    elsif current_user.id == @item.user_id
      redirect_to item_path(@item.id)
      flash[:alert] = '出品者の為、購入できません'
    else
      card = current_user.cards.first
      charge = Payjp::Charge.create(
        amount: @item.price,
        customer: card.customer_id,
        currency: 'jpy',
      )
      if @item.update(soldout: 1)
        flash[:alert] = '購入しました。'
        redirect_to controller: "users", action: 'show', id:current_user.id
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: "users", action: 'show', id:current_user.id
      end
    end
  end

  private


  def get_payjp_info
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
  end
# ユーザーがログインしていなければフロントへ
  def current_user_blank?
    if current_user.blank?
      redirect_to root_path
      flash[:alert] = 'ログインを行なってください。'
    end
  end
# PAYJPを使用できるように
  # def get_payjp_info
  #   if Rails.env == 'development'
  #     Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
  #   else
  #     Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
  #   end
  # end

end
