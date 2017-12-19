require_relative('../db/sql_runner.rb')
require( 'pry-byebug' )

class Transaction

    attr_reader(:id, :vendor_id, :tag_id, :amount, :transaction_date, :comment)

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @vendor_id = options['vendor_id'].to_i
      @tag_id = options['tag_id'].to_i
      @amount = options['amount'].to_f.round(2)
      @transaction_date = options['transaction_date']
      @comment = options['comment'] if options['comment'] || nil
    end

    def save()
      sql = "INSERT INTO transactions
      (vendor_id, tag_id, amount, transaction_date, comment)
      VALUES($1, $2, $3, $4, $5)
      RETURNING *"

      values = [@vendor_id, @tag_id, @amount, @transaction_date, @comment]
      transaction_data = SqlRunner.run(sql, values)
      @id = transaction_data.first()['id'].to_i
    end

    def update()
      sql = "UPDATE transactions
      SET
      (
        vendor_id,
        tag_id,
        amount,
        transaction_date,
        comment
        ) =
      (
          $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@vendor_id, @tag_id, @amount, @transaction_date, @comment, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM transactions
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
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

    def self.total_amount()
      sql = "SELECT SUM (amount) FROM transactions"
      values = []
      total_amount = SqlRunner.run(sql, values)

      return total_amount.first()['sum'].to_f
    end

    def self.tag_total_amount(tag_id)
      sql = "SELECT SUM (amount) FROM transactions
      WHERE tag_id = $1"

      values = [tag_id]
      tag_total_amount = SqlRunner.run(sql, values)

      return tag_total_amount.first()['sum'].to_f.round(2)
    end

    def self.vendor_total_amount(vendor_id)
      sql = "SELECT SUM (amount) FROM transactions
      WHERE vendor_id = $1"

      values = [vendor_id]
      vendor_total_amount = SqlRunner.run(sql, values)

      return vendor_total_amount.first()['sum'].to_f.round(2)
    end
  end
