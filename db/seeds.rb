# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

20.times do |n|
  owner = Owner.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
                email: "example-#{n+1}@webpets.com", password: "password")

  5.times do |n|
    owner.pets.create(  name:Faker::Name.first_name,
                        species: Faker::Creature::Animal.name,
                        breed: Faker::Lorem.word,
                        age: rand(0..20),
                        gender: rand(0..2),
                        color: Faker::Color.color_name
                      )
                  
  end
end

pets =Pet.order(created_at: :desc).take(6)
pets_foll = Pet.order(:created_at).take(40)

pets.each do |o|
  pets_foll.each do |f|
    f.follow(o)
  end
end