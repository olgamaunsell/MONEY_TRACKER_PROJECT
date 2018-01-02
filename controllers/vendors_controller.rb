require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/vendor.rb' )

get '/vendors' do
  @vendors = Vendor.all()
  erb ( :"vendors/index" )
end

# NEW route

get('/vendors/new') do
  erb(:"vendors/new")
end

# CREATE route

post('/vendors') do

  @vendor = Vendor.new(params)
  @vendor.save()

  redirect to("/vendors")
end

# SHOW route

get '/vendors/:id' do
  @vendor = Vendor.find(params['id'].to_i)
  erb( :"vendors/show" )
end

# EDIT route

get('/vendors/:id/edit') do
  @vendor = Vendor.find(params[:id])
  erb(:"vendors/edit")
end

post('/vendors/:id') do
  @vendor = Vendor.new(params)
  @vendor.update
  redirect "/vendors/#{@vendor.id}"
end
