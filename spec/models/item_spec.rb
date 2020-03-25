require 'rails_helper'
# describe Item do
#   describe '#create' do
#     it "is invalid without a name" do
#     end
#     it "is invalid without a name" do
#       item = build(:item, name: "")
#       item.valid?
#       expect(user.errors[:name]).to include("can't be blank")
#     end
#   end
# end

# describe Item do
#   describe '#create' do
#     it "is invalid without a nickname" do
#     end
#   end
# end

describe Item do
  describe '#create' do
    it "is invalid without a nickname" do
      item = Item.new(nickname: "",description: "")
      item.valid?
      expect(item.errors[:nickname]).to include("can't be blank")
    end
  end
  describe '#create' do
    it "is invalid without a descrioption" do
      item = Item.new(description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end
  end
  describe '#create' do
    it "is invalid without a status" do
      item = Item.new(status: "")
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end
  end
  describe '#create' do
    it "is invalid without a shipping_charges" do
      item = Item.new(shipping_charges: "")
      item.valid? 
      expect(item.errors[:shipping_charges]).to include("can't be blank")
    end
  end
  describe '#create' do
    it "is invalid without a area" do
      item = Item.new(area: "")
      item.valid?
      expect(item.errors[:area]).to include("can't be blank")
    end
  end
  describe '#create' do
    it "is invalid without a descrioption" do
      item = Item.new(description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end
  end
  describe '#create' do
    it "is invalid without a days" do
      item = Item.new(days: "")
      item.valid?
      expect(item.errors[:days]).to include("can't be blank")
    end
  end
  describe '#create' do
    it "is invalid without a price" do
      item = Item.new(price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
  end

end