require 'faker'

countries = Country.all

#Create a user
user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,age: rand(18..65),dob: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),email: Faker::Internet.email,phone_number: "9999999999", country_id: countries.sample.id)
  
# Generate an old food item with an "new" product_type
50.times do
  new_food = user.products.create!(
  name: Faker::Food.dish,
  price: Faker::Commerce.price(range: 0..100.0, as_string: false),
  product_type: "new",
  user_id: 1)
end

# Generate an old food item with an "old" product_type
50.times do
  old_food = user.products.create!(
    name: Faker::Food.dish,
    price: Faker::Commerce.price(range: 0..100.0, as_string: false),
    product_type: "old",
    user_id: 1)
end