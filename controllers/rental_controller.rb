require( 'sinatra' )
require( 'sinatra/contrib/all' )
require("pry")
require_relative("../models/Rental")
require_relative("../models/Movie")
require_relative("../models/Customer")
also_reload("../models/*")


get "/rentals" do
  @rentals = Rental.all()
  erb ( :"rentals/index" )
end

get "/rentals/new" do
  @movies = Movie.all()
  @customers = Customer.all()
  erb(:"rentals/new")
end

get "/rentals/:id" do
  @rentals = Rental.find_id(params["id"].to_i)
  erb(:"rentals/new")
end

post "/rentals" do
  rentals = Rental.new(params)
  rentals.save()
  redirect to("/rentals")
end

post '/rentals/:id/delete' do
  rental = Rental.find_id(params[:id])
  rental.delete()
  redirect to("/rentals")
end
