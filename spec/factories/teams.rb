FactoryBot.define do
  factory :team, class: Team do
    name { "test1_team" }
    owner { FactoryBot.create(:user) }
  end
end
