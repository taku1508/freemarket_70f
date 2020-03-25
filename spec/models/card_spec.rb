require 'rails_helper'
describe Card do
  describe '#create' do
    it "is invalid without a days" do
      card = Card.new(customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a days" do
      card = Card.new(card_id: "")
      card.valid?
      xpect(card.errors[:card_id]).to include("can't be blank")
    end
  end
end