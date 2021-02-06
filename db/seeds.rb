
puts "cleaning house"
Booking.destroy_all
Inspection.destroy_all
User.destroy_all
puts "done cleaning "

user1 = User.create(
  email: Faker::Internet.email,
  password: 123456,
  name: Faker::Name.name,
  description: Faker::Twitter.status,
  username: Faker::Superhero.prefix,
  )

user2 = User.create(
  email: Faker::Internet.email,
  password: 123456,
  name: Faker::Name.name,
  description: Faker::Twitter.status,
  username: Faker::Superhero.prefix,
  )

puts "done creating all users "

5.times do
  Inspection.create(
    user_id: user1.id,
    location: Faker::Address.full_address,
    )
end

5.times do
  Inspection.create(
    user_id: user2.id,
    location: Faker::Address.full_address,
    )
end

puts "done creating all inspections "

Inspection.all.each do |ins|
  if ins.user_id == user1.id
    2.times do ||
      Booking.create(
      inspection_id: ins.id,
      user_id: user2.id,
      note: Faker::Movie.quote
      )
    end
  else
    2.times do ||
      Booking.create(
      inspection_id: ins.id,
      user_id: user1.id,
      note: Faker::Movie.quote
      )
    end
  end
end
puts "done creating all seeds "
