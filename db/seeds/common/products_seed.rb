require 'faker'

# Generate a new food item with a "new" product_type
50.times do
  new_food = Product.create!(
    name: Faker::Food.dish,
    price: Faker::Commerce.price(range: 0..100.0, as_string: false),
    product_type: "new"
  )
end


# Generate an old food item with an "old" product_type
50.times do
  old_food = Product.create!(
    name: Faker::Food.dish,
    price: Faker::Commerce.price(range: 0..100.0, as_string: false),
    product_type: "old"
  )
end