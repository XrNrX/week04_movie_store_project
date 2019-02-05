require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/Customer")
require_relative("../models/Movie")
require_relative("../models/Rental")
also_reload("../models/*")

get '/customers' do
  @customers = Customer.all()
  erb(:"customers/index")
end

get "/customers/show" do
  @movies = Movie.all()
  erb(:"customers/show")
end

get "/customers/:id" do
  @customer = Customer.find_id(params["id"].to_i)
  erb(:"customers/show")
end

get "/customers/:id/edit" do
  @customer = Customer.find_id(params[:id])
  erb(:"customers/edit")
end

post "/customers/:id" do
  customer = Customer.new(params)
  customer.update()
  redirect to("/customers")
end

post "/customers" do
  customer = Customer.new(params)
  customer.save
  redirect to("/customers")
end

post "/customers/:id/delete" do
  customer = Customer.find_id(params[:id])
  customer.delete()
  redirect to("/customers")
end
