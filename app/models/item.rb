class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  has_many :images, dependent: :destroy
  # accepts_nested_attributes_for :brands
  accepts_nested_attributes_for :images, allow_destroy: true
  # accepts_nested_attributes_for :category

  validates :nickname, presence: true, length: { maximum: 6 }
  validates :description, presence: true
  validates :status, presence: true
  validates :shipping_charges, presence: true
  validates :area, presence: true
  validates :days, presence: true
  validates :price, presence: true
end
