class Movie

attr_accessor( :name, :certificate, :id)

def initialize(options)
  @name = options["name"]
  @certificate = options["certificate"]
  @id = options["id"].to_i if options["id"]
end

def save()
  sql = "INSERT INTO movies
  (name, certificate)
  VALUES
  ($1, $2)
  RETURNING id"
  values = [@name, @certificate]
  results = SqlRunner.run(sql, values)
  @id = results.first["id"].to_i
end


end
