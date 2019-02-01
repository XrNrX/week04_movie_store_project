class Rental

  attr_accessor( :customer_id, :movie_id, :id )

def initialize(options)
    @customer_id = options["customer_id"].to_i
    @movie_id = options["movie_id"].to_i
    @id = options["id"].to_i if options["id"]

end

def save()
  sql = "INSERT INTO rentals
  (customer_id, movie_id)
  VALUES
  ($1, $2)
  RETURNING id"
  values = [@customer_id, @movie_id]
  results = SqlRunner.run(sql, values)
  @id = results.first["id"].to_i
end

def self.all()
  sql = "SELECT * FROM rentals"
  results = SqlRunner.run(sql)
  return results.map { |rental| Rental.new(rental) }
end

end
