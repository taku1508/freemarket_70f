class Address < ApplicationRecord
  # belongs_to :user ,optional: true
  has_one :user
end
