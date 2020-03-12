class Category < ApplicationRecord
  has_many :item
  has_ancestry
end
