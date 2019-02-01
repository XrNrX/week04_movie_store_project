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

movie1 = Movie.new({
  "name" => "Lord of the Rings",
  "certificate" => "PG",
  "url" => "/images/lotr.jpg"
  })

movie1.save()

movie2 = Movie.new({
  "name" => "Aliens",
  "certificate" => "18",
  "url" => "/images/aliens.jpg"
  })

movie2.save()

movie3 = Movie.new({
  "name" => "Big Trouble in Little China",
  "certificate" => "15",
  "url" => "/images/big_trouble.jpg"
  })

movie3.save()

movie4 = Movie.new({
  "name" => "Crouching Tiger, Hidden Dragon",
  "certificate" => "12",
  "url" => "/images/crouching_tiger.jpg"
  })

movie4.save()

movie5 = Movie.new({
  "name" => "The Terminator",
  "certificate" => "18",
  "url" => "/images/the_terminator.jpg"
  })

movie5.save()

movie6 = Movie.new({
  "name" => "The Matrix",
  "certificate" => "15",
  "url" => "/images/the_matrix.jpg"
  })

movie6.save()

movie7 = Movie.new({
  "name" => "Predator",
  "certificate" => "18",
  "url" => "/images/predator.jpg"
  })

movie7.save()

movie8 = Movie.new({
  "name" => "Ong-Bak",
  "certificate" => "18",
  "url" => "/images/ong_bak.jpg"
  })

movie8.save()

rental1 = Rental.new({
  "movie_id" => movie3.id,
  "customer_id" => customer1.id
  })

rental1.save()

rental2 = Rental.new({
  "movie_id" => movie5.id,
  "customer_id" => customer2.id
  })

rental2.save()

rental3 = Rental.new({
  "movie_id" => movie1.id,
  "customer_id" => customer3.id
  })

rental3.save()

rental4 = Rental.new({
  "movie_id" => movie8.id,
  "customer_id" => customer4.id
  })

rental4.save()

binding.pry
nil
