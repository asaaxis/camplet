FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'test1' }
    email { 'test1@example.com' }
    password { 'test11' }
    admin { true }
  end
  factory :second_user, class: User do
    id { 2 }
    name { 'test2' }
    email { 'test2@example.com' }
    password { 'test22' }
    admin { false }
  end
end