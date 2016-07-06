Fabricator(:vehicle) do
  id                1
  name              { Faker::Lorem.words(10) }
  description       { Faker::Lorem.paragraph(1) }
  short_description { Faker::Lorem.words(20) }
  active            false
  cost_price        "9.99"
  created_at        "2016-05-30 03:38:20"
  updated_at        "2016-05-30 03:38:20"
  category_id       1
end
