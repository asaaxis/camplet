class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :travel_plan

  validates :content, presence: true
end
