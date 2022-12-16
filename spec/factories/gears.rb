FactoryBot.define do
  factory :gear, class: Gear do
    name { 'テント' }
    description { '4人入れます' }
    quantity { '1' }
  end
end