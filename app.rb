require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transactions_controller')
require_relative('controllers/vendors_controller')
require_relative('controllers/tags_controller')
# require( 'pry-byebug' )

get '/' do
  erb( :index )
end
