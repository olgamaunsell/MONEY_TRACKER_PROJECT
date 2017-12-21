require_relative('../db/sql_runner.rb')
require( 'pry-byebug' )

class Budget

  attr_reader(:id, :month_no, :year, :name, :tag_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @month_no = options['month_no']
    @year = options['year']
    @name = options['name']
    @tag_id = options['tag_id']
    @monthly_limit = options['monthly_limit'].to_f.round(2)
  end

  def monthly_limit ()
    monthly_limit = display_2_dec_places(@monthly_limit)
    return monthly_limit
  end

  def save()
    sql = "INSERT INTO budgets
    (month_no, year, name, tag_id, monthly_limit)
    VALUES($1, $2, $3, $4, $5)
    RETURNING *"

    values = [@month_no, @year, @name, @tag_id, @monthly_limit]
    budget_data = SqlRunner.run(sql, values)
    @id = budget_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE budgets
    SET
    (month_no, year, name, tag_id, monthly_limit) =
    (
        $1, $2, $3, $4, $5
    )
    WHERE id = $6"

    values = [@month_no, @year, @name, @tag_id, @monthly_limit, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM budgets
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def tag()
    tag = Tag.find(@tag_id)
    return tag
  end

  def month_name()
    month_name = Month.find_month_name(@month_no.to_s)
    return month_name
  end

  def display_2_dec_places(amount)
    amount_s = amount.to_s
    amount_arr = amount_s.split('')
    if amount_arr[-3] != '.'
      amount_arr.insert(-1,'0')
    end
    return amount = amount_arr.join()
  end
  
  def mth_yr_tag_tot_amt()
    actual_spend = Transaction.mth_yr_tag_tot_amt(@month_no, @year, @tag_id)
    actual_spend_display = display_2_dec_places(actual_spend)
    return actual_spend_display
  end

  def remaining_amount()
    actual_spend = mth_yr_tag_tot_amt().to_f
    remaining_amount = @monthly_limit - actual_spend
    remaining_amount_display = display_2_dec_places(remaining_amount)
    return remaining_amount_display
  end

  def self.all()
    sql = "SELECT * FROM budgets
    ORDER BY budgets.year DESC,
    budgets.month_no DESC"
    values = []
    result = SqlRunner.run(sql, values)
    budgets = Budget.map_items(result)
    return budgets
  end

  def self.find(id)
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    budget = Budget.new(result.first)
    return budget
  end

  def self.delete_all()
    sql = "DELETE FROM budgets"
    values =[]
    SqlRunner.run(sql, values)
  end

  def self.map_items(budget_data)
    result = budget_data.map {|budget| Budget.new(budget)}
    return result
  end

end
