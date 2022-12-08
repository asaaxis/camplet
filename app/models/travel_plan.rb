class TravelPlan < ApplicationRecord
  validates :name, presence: true

  belongs_to :team
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
end
