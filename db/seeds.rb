# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
(6..12).each do |elem|
    Category.create(
        name: Faker::Esport.game,
        description: Faker::Company.buzzword
    )
end

(6..29).each do |elem|
    Operation.create(
        amount: Faker::Number.decimal(l_digits: 2),
        operation_date: Faker::Time.between(from: DateTime.now - 47, to: DateTime.now, format: :default),
        description: Faker::Company.profession,
        category_id: Faker::Number.within(range: 1..20)
    )

end