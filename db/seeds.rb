
5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_digest: Faker::Internet.password(8)
    )
end

ruby1 = Deck.new(title: "ruby")
ruby1.save
card1= Card.new(question: "What is put?", answer: "Prints to screen", deck_id: 1)
card1.save
card2= Card.new(question: "What is while?", answer: "A loop that runs while a condition is true", deck_id: 1)
card2.save
card3= Card.new(question: "What is do?", answer: "a block to run", deck_id: 1)
card3.save
card4= Card.new(question: "How do you define a function?", answer: "def method_name", deck_id: 1)
card4.save
card5= Card.new(question: "Who invented Ruby?", answer: "A japanese guy", deck_id: 1)
card5.save
card6= Card.new(question: "How long is phase 0?", answer: "9 weeks ..hopefully", deck_id: 1)
card6.save

