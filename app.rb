require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transactions_controller')
require_relative('controllers/vendors_controller')
require_relative('controllers/tags_controller')

get '/' do
  erb( :index )
end
