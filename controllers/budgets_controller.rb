require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/budget.rb' )
require_relative( '../models/tag.rb' )

get '/budgets' do
  @tags = Tag.all()
  @budgets = Budget.all()
  erb ( :"budgets/index" )
end

# NEW route

get('/budgets/new') do
  erb(:"budgets/new")
end

# CREATE route

post('/budgets') do

  @budget = Budget.new(params)
  @budget.save()

  redirect to("/budgets")
end

# SHOW route

get '/budgets/:id' do
  @budget = Budget.find(params['id'].to_i)

  erb( :"budgets/show" )
end

# EDIT route

get('/budgets/:id/edit') do
  @budget = Budget.find(params[:id])
  erb(:"budgets/edit")
end

post('/budgets/:id') do
  @budget = Budget.new(params)
  @budget.update
  redirect "/budgets/#{@budget.id}"
end
