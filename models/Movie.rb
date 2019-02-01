class Movie

attr_accessor( :name, :certificate, :id, :url )

def initialize(options)
  @name = options["name"]
  @certificate = options["certificate"]
  @id = options["id"].to_i if options["id"]
  @url = options["url"]
end

def save()
  sql = "INSERT INTO movies
  (name, certificate, url)
  VALUES
  ($1, $2, $3)
  RETURNING id"
  values = [@name, @certificate, @url]
  results = SqlRunner.run(sql, values)
  @id = results.first["id"].to_i
end

def update()
  sql = "UPDATE movies
  SET (name, certificate, url)
  = ($1, $2, $3)
  WHERE id = $4"
  values = [@name, @certificate, @url, @id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM movies"
  results = SqlRunner.run(sql)
  return results.map { |movie| Movie.new(movie) }
end

def delete()
  sql = "DELETE FROM movies
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM movies"
  SqlRunner.run(sql)
end

def self.find_id(id)
  sql = "SELECT FROM movies
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Movie.new(results.first)
end




end
