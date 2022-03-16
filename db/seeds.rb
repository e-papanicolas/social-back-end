puts "Seeding, 1 sec..."

50.times do 
  User.create(
    username: "#{Faker::Superhero.prefix.downcase}-#{Faker::Food.dish.split[0].downcase}",
    password_digest: "password",
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    avatar: Faker::Placeholdit.image(size: '300x300', format: 'jpg'),
    email: Faker::Internet.email.downcase,
  )
end

50.times do
  Post.create(
  content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
  user_id: rand(User.first.id..User.last.id)
  )
end



puts "Seed finished!!"