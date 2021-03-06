
puts "cleaning house"
Booking.destroy_all
Inspection.destroy_all
User.destroy_all
puts "done cleaning "

user1 = User.create!(
  email: "user@user.com",
  password: 123456,
  name: Faker::Name.name,
  description: Faker::Food.description,
  username: Faker::Superhero.prefix
)

user2 = User.create!(
  email: "user2@user.com",
  password: 123456,
  name: Faker::Name.name,
  description: Faker::Food.description,
  username: Faker::Superhero.prefix
)

puts "done creating all users "

5.times do
  Inspection.create(
    user_id: user1.id,
    location: Faker::Address.full_address,
    payment_amount: Faker::Commerce.price(range: 0..10.0, as_string: true),
    description: Faker::Music::Prince.lyric,
    time: Faker::Time.backward(days: 14, period: :evening),
    date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short),
    longitude:Faker::Address.longitude,
    latitude:Faker::Address.latitude
    )
end

5.times do
  Inspection.create(
    user_id: user2.id,
    location: Faker::Address.full_address,
    payment_amount: Faker::Commerce.price(range: 0..10.0, as_string: true),
    description: Faker::Music::Prince.lyric,
    time: Faker::Time.backward(days: 14, period: :evening),
    date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    finish_time:Faker::Time.backward(days: 14, period: :evening),
    longitude:Faker::Address.longitude,
    latitude:Faker::Address.latitude
    )
end

puts "done creating all inspections "

Inspection.all.each do |ins|
  if ins.user_id == user1.id
    Booking.create(
    status: "Pending",
    inspection_id: ins.id,
    user_id: user2.id,
    note: Faker::Movie.quote,
    )
  else
    Booking.create(
    status: "Pending",
    inspection_id: ins.id,
    user_id: user1.id,
    note: Faker::Movie.quote,
    )
  end
end
puts "done creating all seeds "

