require_relative('../db/sql_runner.rb')

class Vendor

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO vendors
    (name)
    VALUES($1)
    RETURNING *"

    values = [@name]
    vendor_data = SqlRunner.run(sql, values)
    @id = vendor_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM vendors"
    values = []
    result = SqlRunner.run(sql, values)
    vendors = Vendor.map_items(result)
    return vendors
  end

  def self.find(id)
    sql = "SELECT * FROM vendors WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    vendor = Vendor.new(result.first)
    return vendor
  end

  def self.delete_all()
    sql = "DELETE FROM vendors"
    values =[]
    SqlRunner.run(sql, values)
  end

  def self.map_items(vendor_data)
    result = vendor_data.map {|vendor| Vendor.new(vendor)}
    return result
  end

end
