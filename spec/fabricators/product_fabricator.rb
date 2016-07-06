Fabricator(:product) do
  name                  { Faker::Lorem.words(10) }
  description           { Faker::Lorem.paragraph(1) }
end
