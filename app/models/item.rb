class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  has_many :images, dependent: :destroy
  # accepts_nested_attributes_for :brands
  accepts_nested_attributes_for :images, allow_destroy: true
  # accepts_nested_attributes_for :category
end
