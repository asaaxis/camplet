class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :travel_plans, through: :labellings
end
