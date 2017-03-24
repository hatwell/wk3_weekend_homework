require_relative('../db/sql_runner')

class Film
  attr_reader :title, :year_of_release, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @year_of_release = options['year_of_release'].to_i
    @price = options['price'].to_i
  end
  def save()
    sql = "INSERT INTO films(title, year_of_release, price) VALUES ('#{@title}', #{@year_of_release}, #{@price}) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, year_of_release, price) = ('#{@title}', #{@year_of_release}, #{@price}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films"
    return Film.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result
  end

end
