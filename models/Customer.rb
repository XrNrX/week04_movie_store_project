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

def self.all()
  sql = "SELECT * FROM customers"
  results = SqlRunner.run(sql)
  return results.map { |customer| Customer.new(customer) }
end

end
