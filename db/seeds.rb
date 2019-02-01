require_relative("../models/Customer")
require_relative("../models/Movie")
require_relative("../models/Rental")
require("pry")

customer1 = Customer.new({
  "name" => "Stuart",
  "address" => "22C An Average Street",
  "age" => "33",
})
customer1.save()

customer2 = Customer.new({
  "name" => "Jenny",
  "address" => "11 Unicorn Avenue",
  "age" => "32"
  })
  customer2.save()

customer3 = Customer.new({
  "name" => "Smudge",
  "address" => "Room 101 Luxury Cat's Hotel",
  "age" => "12"
  })
  customer3.save()

customer4 = Customer.new({
  "name" => "Scooby-Doo",
  "address" => "In a Van, Crystal Cove",
  "age" => "7"
  })
  customer4.save()
