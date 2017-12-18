require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/vendor.rb' )
require_relative( '../models/tag.rb' )

# INDEX - show all transactions

get('/transactions') do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

# NEW route

get('/transactions/new') do
  @vendors = Vendor.all()
  @tags = Tag.all()
  erb(:"transactions/new")
end
