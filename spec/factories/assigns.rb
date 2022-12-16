FactoryBot.define do
  factory :assign, class: Assign do
    user { FactoryBot.create(:user)}
    team { FactoryBot.create(:team)}
  end
end