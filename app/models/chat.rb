class Chat < ApplicationRecord
  validates :content, presence: true
  
  belongs_to :user
  belongs_to :travel_plan
end
