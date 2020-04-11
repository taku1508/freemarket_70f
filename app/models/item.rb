class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  has_many :images, dependent: :destroy
  validates :nickname, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :shipping_charges, presence: true
  validates :area, presence: true
  validates :days, presence: true
  validates :category, presence: true
  validates :price, presence: true
  accepts_nested_attributes_for :images,allow_destroy: true
end
