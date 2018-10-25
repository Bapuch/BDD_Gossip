require 'faker'

# Create 10 cities
10.times { City.create!(name: Faker::Address.city, postal_code: Faker::Address.postcode) }

# Create 10 users
10.times do
  city = City.find(rand(City.all.count)+City.first.id)
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: city.id, age: Faker::Number.number(2).to_i, email: Faker::Internet.email, description: Faker::HowIMetYourMother.quote)
  city.users << user
end

#Create 20 gossips
20.times do
  user = User.find(rand(User.all.count) + User.first.id)
  gossip = Gosssip.create!(title: Faker::RickAndMorty.location, content: Faker::RickAndMorty.quote, user_id: user.id)
  user.gosssips << gossip
end

#Create 10 tags
10.times { Tag.create!(title: Faker::RickAndMorty.character) }

# add between 1 and 4 tags to each gossip
Gosssip.all.each do |go|
  (rand(4) + 1).times do
    i = rand(Tag.all.count) + Tag.first.id
    tag = Tag.find(i)
    go.tags << tag
    tag.gosssips << go
  end
end

# create 1 private message with 3 receivers
sender = User.first
pm = PrivateMessage.new
pm.sender = sender
pm.content = Faker::NewGirl.quote
(1..3).each do |i|
  recip = User.find(rand(User.all.count - 1) + User.first.id + 1)
  pm.recs << recip
  pm.save
  recip.received_messages << pm
end
sender.sent_messages << pm


# Create 20 comments
20.times do
  user = User.find(rand(User.all.count) + User.first.id)
  gossip = Gosssip.find(rand(Gosssip.all.count) + Gosssip.first.id)
  Comment.create!(content: Faker::PrincessBride.quote, user_id: user.id, gosssip_id: gossip.id)
end

# Create 20 likes
10.times do
  user = rand(User.all.count) + User.first.id
  comment = rand(Comment.all.count) + Comment.first.id
  gossip = Gosssip.find(rand(Gosssip.all.count) + Gosssip.first.id)
  Like.create!(user_id: user, gosssip_id: gossip)
  Like.create!(user_id: user, comment_id: comment)
end

# Add sub comments to existing comments
Comment.all.each do |com|
  rand(4).times do
    user = User.find(rand(User.all.count) + User.first.id)
    gossip = Gosssip.find(rand(Gosssip.all.count) + Gosssip.first.id)
    sub = Comment.create!(content: Faker::PrincessBride.quote, user_id: user.id, gosssip_id: gossip.id, related_comment_id: com.id)
    com.sub_comments << sub
  end
end
