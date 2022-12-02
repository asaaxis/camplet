class Gear < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
end
