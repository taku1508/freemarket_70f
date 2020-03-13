require 'test_helper'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.new(name: "Example User", description: "user@example",
    status: "aaa", shipping_charges: "aaa", area: "1",
    days: "1", price: "11", user: "1", category: "1")
  end
  # test "should be valid" do
  #   assert @item.valid?
  # end

end