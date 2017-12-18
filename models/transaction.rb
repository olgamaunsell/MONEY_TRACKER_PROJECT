require_relative('../db/sql_runner.rb')
require( 'pry-byebug' )

class Transaction

  attr_reader(:id, :vendor_id, :tag_id, :value, :transaction_date, :comment)

  #extension field on transactions table - month_id ?

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @vendor_id = options['vendor_id'].to_i
    @tag_id = options['tag_id'].to_i
    @value = options['value'].to_i
    @transaction_date = options['transaction_date']
    @comment = options['comment'] if options['comment'] || nil
  end

  def save()
    sql = "INSERT INTO transactions
    (vendor_id, tag_id, value, transaction_date, comment)
    VALUES($1, $2, $3, $4, $5)
    RETURNING *"

    values = [@vendor_id, @tag_id, @value, @transaction_date, @comment]
    transaction_data = SqlRunner.run(sql, values)
    @id = transaction_data.first()['id'].to_i
  end

  def vendor()
    vendor = Vendor.find(@vendor_id)
  
    return vendor

  end

  def tag()
    tag = Tag.find(@tag_id)
    return tag
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    values = []
    result = SqlRunner.run(sql, values)
    transactions = Transaction.map_items(result)
    return transactions
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    transaction = Transaction.new(result.first)
    return transaction
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    values =[]
    SqlRunner.run(sql, values)
  end

  def self.map_items(transaction_data)
    result = transaction_data.map {|transaction| Transaction.new(transaction)}
    return result
  end

end
