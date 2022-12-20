class Gear < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
  
  belongs_to :user
  has_many :belongings, dependent: :destroy
  has_many :travel_plans, through: :belongings

  mount_uploader :image, ImageUploader
end
