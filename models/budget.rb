require_relative('../db/sql_runner.rb')

class Budget

  attr_reader(:id, :month_no, :year, :name, :tag_id, :monthly_limit)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @month_no = options['month_no']
    @year = options['year']
    @name = options['name']
    @tag_id = options['tag_id']
    @monthly_limit = options['monthly_limit']
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

  def self.all()
    sql = "SELECT * FROM budgets"
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
