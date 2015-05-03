Fabricator(:card) do
  title { Faker::Lorem.words(1).first }
  heading { Faker::Lorem.words(1).first }
  description { Faker::Lorem.paragraph }
  user { Fabricate(:user) }
  deck { Fabricate(:deck) }
end
