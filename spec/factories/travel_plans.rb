FactoryBot.define do
  factory :travel_plan, class: TravelPlan do
    name { 'Tokyo' }
    start_schedule_at { '2022-01-01 00:00:00' }
    end_schedule_at { '2022-01-01 00:00:00' }
    team { FactoryBot.create(:team) }
  end
end
