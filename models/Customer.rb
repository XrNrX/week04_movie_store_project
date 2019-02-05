require_relative("../db/sql_runner")

class Customer

  attr_accessor( :name, :address, :age, :id )

  def initialize(options)
    @name = options["name"]
    @address = options["address"]
    @age = options["age"]
    @id = options["id"].to_i if options["id"]
  end

  def save()
    sql = "INSERT INTO customers
    (name, address, age)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@name, @address, @age]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i
  end

  def update()
    sql = "UPDATE customers
    SET (name, address, age)
    = ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @address, @age, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map { |customer| Customer.new(customer) }
  end

  def delete()
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.find_id(id)
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results.first)
  end

  def movies()
    sql = "SELECT movies.*
    FROM movies INNER JOIN rentals
    ON rentals.movie_id = movies.id
    WHERE customer_id = $1"
    values = [@id]
    movies = SqlRunner.run(sql, values)
    return movies.map { |movie| Movie.new(movie)}
  end

  def rentals()
    sql = "SELECT customers.*, rentals.* FROM customers
    LEFT JOIN rentals
    ON customers.id = rentals.customer_id
    WHERE movie_id = $1"
    values = [@id]
    rentals = SqlRunner.run(sql, values)
    return rentals.map { |rental| Rental.new(rental) }
  end

  def fix_name()
    return "#{@name.capitalize}"
  end

end
