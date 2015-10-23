5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_digest: Faker::Internet.password(8)
    )
end
