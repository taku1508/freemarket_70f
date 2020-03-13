require 'rails_helper'
describe Item do
  describe '#create' do
    it "is invalid without a name" do
    end
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end