require_relative('../db/sql_runner.rb')

class Tag

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags
    (name)
    VALUES($1)
    RETURNING *"

    values = [@name]
    tag_data = SqlRunner.run(sql, values)
    @id = tag_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags"
    values = []
    result = SqlRunner.run(sql, values)
    tags = Tag.map_items(result)
    return tags
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    tag = Tag.new(result.first)
    return tag
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    values =[]
    SqlRunner.run(sql, values)
  end

  def self.map_items(tag_data)
    result = tag_data.map {|tag| Tag.new(tag)}
    return result
  end

end
