require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/vendor.rb' )
require_relative( '../models/tag.rb' )

# INDEX - show all transactions

get('/transactions') do
  @total_amount = Transaction.total_amount()
  @tags = Tag.all()
  @transactions = Transaction.all()
  @over_budget = Transaction.current_mth_year_over_budget()
  erb(:"transactions/index")
end

# NEW route

get('/transactions/new') do
  # @current_date = Transaction.current_date()
  @vendors = Vendor.all()
  @tags = Tag.all()
  erb(:"transactions/new")
end

# CREATE route

post('/transactions') do

  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:"transactions/create")
  # redirect to("/transactions")
end

# SHOW route

get('/transactions/:id') do

  id = params[:id]
  @transaction = Transaction.find(id)
  erb(:"transactions/show")
  # redirect to("/transactions")
end

# DELETE route

post('/transactions/:id/delete') do
  id = params[:id]
  @transaction = Transaction.find(id)
  @transaction.delete()

  redirect "/transactions"

end
# EDIT route
# two stages: find transaction, allow user screen update
# then update database

get('/transactions/:id/edit') do
  @vendors = Vendor.all()
  @tags = Tag.all()
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit")
end

post('/transactions/:id') do
  @transaction = Transaction.new(params)
  @transaction.update
  redirect "/transactions/#{@transaction.id}"
end
