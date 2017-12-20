require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/budget.rb' )
require_relative( '../models/tag.rb' )
require_relative( '../models/month.rb' )
# require( 'pry-byebug' )

get '/budgets' do
  @tags = Tag.all()
  @budgets = Budget.all()
  erb ( :"budgets/index" )
end

# NEW route

get('/budgets/new') do
  @tags = Tag.all()
  @months = Month.all()
  erb(:"budgets/new")
end

# CREATE route

post('/budgets') do

  @budget = Budget.new(params)
  @budget.save()

  # redirect to("/budgets")
end

# SHOW route

get '/budgets/:id' do
  @budget = Budget.find(params['id'].to_i)
  # month_no = @budget.month_no
  # year = @budget.year
  # tag_id = @budget.tag_id
  @actual_spend = @budget.mth_yr_tag_tot_amt()
  @remaining_amount = @budget.remaining_amount()
  # @actual_spend = Budget.mth_yr_tag_tot_amt()

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
