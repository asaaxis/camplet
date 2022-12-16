FactoryBot.define do
  factory :user do
    name { 'test1' }
    email { 'test1@example.com' }
    password { 'test11' }
    admin { true }
  end
  factory :second_user, class: User do
    name { 'test2' }
    email { 'test2@example.com' }
    password { 'test22' }
    admin { false }
  end
end