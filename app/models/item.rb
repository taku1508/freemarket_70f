class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  has_many :images
  has_many :item_categoriesrtu9
end
