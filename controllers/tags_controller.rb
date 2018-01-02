require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb' )

get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

# NEW route

get('/tags/new') do
  erb(:"tags/new")
end

# CREATE route

post('/tags') do

  @tag = Tag.new(params)
  @tag.save()

  redirect to("/tags")
end

# SHOW route

get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)

  erb( :"tags/show" )
end

# EDIT route

get('/tags/:id/edit') do
  @tag = Tag.find(params[:id])
  erb(:"tags/edit")
end

post('/tags/:id') do
  @tag = Tag.new(params)
  @tag.update
  redirect "/tags/#{@tag.id}"
end
