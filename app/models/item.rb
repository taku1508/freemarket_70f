class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  has_many :images
  has_many :item_categories
  # has_many :categories, through: :item_categories
end
