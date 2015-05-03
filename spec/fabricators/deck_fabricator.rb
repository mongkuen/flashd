Fabricator(:deck) do
  name { Faker::Lorem.words(1).first }
  user { Fabricate(:user) }
end
