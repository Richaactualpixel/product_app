# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.connection.execute(File.read("#{Rails.root}/db/seeds/sql/countries.sql"))

Dir[File.join(Rails.root, 'db', 'seeds/common', '*.rb')].sort.each {|seed| load seed }

