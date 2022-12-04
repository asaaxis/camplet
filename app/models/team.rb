class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :members, through: :assigns, source: :user

  def invite_member(user)
    assigns.create(user: user)
  end
end
