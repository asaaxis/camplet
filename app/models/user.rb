class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true

  has_many :gears
  has_many :teams, foreign_key: :owner_id, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :teams, through: :assigns, source: :team, dependent: :destroy
  has_many :chats, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.name = "ゲスト管理者"
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end
end
