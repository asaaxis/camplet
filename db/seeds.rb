User.create!(
  [
    { name:"taka", email:"taka_1@example.com", password: "123456", admin: true},
    { name:"tara", email:"tara_2@example.com", password: "123457" },
    { name:"tare", email:"tare_3@example.com", password: "123458" },
    { name:"tako", email:"tako_4@example.com", password: "123459" },
    { name:"tama", email:"tama_5@example.com", password: "123450" },
    { name:"tori", email:"tori_6@example.com", password: "123451" },
    { name:"tach", email:"tach_7@example.com", password: "123452" },
    { name:"tio", email:"tio_8@example.com", password: "123453" },
    { name:"teru", email:"teru_9@example.com", password: "123454" },
    { name:"tati", email:"tati_10@example.com", password: "123455" },
    { name:"ゲストユーザー", email:"guest@example.com", password: "SecureRandom.urlsafe_base64" },
    { name:"ゲスト管理者ユーザー", email:"guest_admin@example.com", password:"SecureRandom.urlsafe_base64", admin: true}
  ]
)

Team.create!(
  [
    {name: "ワクワク会", owner_id: 3},
    {name: "エンジョイ勢", owner_id: 1},
    {name: "ガチ勢", owner_id: 5},
    {name: "友人", owner_id: 2},
    {name: "のんびり会", owner_id: 4}
  ]
)

Assign.create!(
  [
    {user_id: 1, team_id: 1},
    {user_id: 2, team_id: 1},
    {user_id: 3, team_id: 1},
    {user_id: 4, team_id: 2},
    {user_id: 5, team_id: 2},
    {user_id: 6, team_id: 2},
    {user_id: 7, team_id: 2},
    {user_id: 8, team_id: 3},
    {user_id: 9, team_id: 3},
    {user_id: 10, team_id: 3},
    {user_id: 1, team_id: 3},
    {user_id: 2, team_id: 3},
    {user_id: 3, team_id: 3},
    {user_id: 4, team_id: 4},
    {user_id: 5, team_id: 4},
    {user_id: 9, team_id: 4},
    {user_id: 10, team_id: 5},
    {user_id: 11, team_id: 5},
    {user_id: 12, team_id: 5},
    {user_id: 6, team_id: 1},
    {user_id: 10, team_id: 2}
  ]
)

15.times do |n|
  start_day_start = Date.new(2023, 8, 15)
  start_day_end = Date.new(2023, 8, 16)
  end_day_start = Date.new(2023, 8, 16)
  end_day_end = Date.new(2023, 8, 17)
  TravelPlan.create!(
    team_id: Random.rand(1..5),
    name: "東京#{n}",
    start_schedule_at: Random.rand(start_day_start..start_day_end),
    end_schedule_at: Random.rand(end_day_start..end_day_end),
  )
end

Label.create!(
  [
    {name: "テント"},
    {name: "チェア"},
    {name: "テーブル"},
    {name: "シュラフ"},
    {name: "マット"},
    {name: "ランタン"},
    {name: "焚き火台"},
    {name: "バーナー"},
    {name: "クーラーボックス"},
    {name: "カトラリー"},
    {name: "ゴミ袋"},
    {name: "ティシュ"},
    {name: "タオル"},
    {name: "食洗用スポンジ"}
  ]
)