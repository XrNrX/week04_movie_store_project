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

def update()
  sql = "UPDATE rentals
  SET (customer_id, movie_id)
  = ($1, $2)
  WHERE id = $3"
  values = [@customer_id, @movie_id, @id]
  SqlRunner.run(sql, values)

end

def self.all()
  sql = "SELECT * FROM rentals"
  results = SqlRunner.run(sql)
  return results.map { |rental| Rental.new(rental) }
end

def self.delete_all()
  sql = "DELETE FROM rentals"
  SqlRunner.run(sql)
end

def find_id(id)
  sql = "SELECT FROM rentals
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Rental.new(results.first)
end



end
