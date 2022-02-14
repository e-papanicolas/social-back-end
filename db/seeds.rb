# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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

Friendship.create(
  user_id: User.first.id,
  friend_id: User.third.id
)

Friendship.create(
  user_id: User.last.id,
  friend_id: User.second.id
)

5.times do
  Chat.create(name: Faker::Emotion.noun)
end

10.times do 
  ChatMessage.create(content: Faker::Lorem.sentences, user_id: User.first.id, chat_id: Chat.first.id);
end

10.times do 
  ChatMessage.create(content: Faker::Lorem.sentences, user_id: User.second.id, chat_id: Chat.first.id);
end

10.times do 
  ChatMessage.create(content: Faker::Lorem.sentences, user_id: User.third.id, chat_id: Chat.second.id);
end

10.times do 
  ChatMessage.create(content: Faker::Lorem.sentences, user_id: User.last.id, chat_id: Chat.second.id);
end

10.times do 
  ChatMessage.create(content: Faker::Lorem.sentences, user_id: User.first.id, chat_id: Chat.last.id);
end

puts "Seed finished!!"