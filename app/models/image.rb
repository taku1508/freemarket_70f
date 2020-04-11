class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item, optional: true
  validates_presence_of :item
  validates :image, presence: true
end
