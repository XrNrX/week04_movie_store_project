require( 'sinatra' )
require( 'sinatra/contrib/all' )
require("pry")
require_relative("../models/Movie")
also_reload("../models/*")


get '/movies' do
  @movies = Movie.all()
  @customers = Customer.all()
  erb(:"movies/index")
end

get "/movies/show" do
  @customers = Customer.all()
  erb(:"movies/show")
end

get "/movies/:id" do
  @movie = Movie.find_id(params["id"].to_i)
  erb(:"movies/show")
end

post "/movies" do
  movies = Movie.new(params)
  movies.save
  redirect to("/movies")
end

post '/movies/:id/delete' do
  movie = Movie.find_id(params[:id])
  movie.delete()
  redirect to("/movies")
end

post "/movies/:id/edit" do
  movie = Movie.find_id(params[:id])
  movie.update()
  redirect to("/movies")
end
