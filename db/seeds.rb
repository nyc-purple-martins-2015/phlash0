5.times do {
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password_digest: Faker::Internet.password(8)
}
