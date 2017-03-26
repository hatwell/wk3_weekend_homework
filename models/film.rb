require_relative('../db/sql_runner')

class Film
  attr_reader :title, :year_of_release, :price, :id

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

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = #{@id}"
    return Customer.map_items(sql)
  end

  def how_many_customers
    return customers().length
  end

  def screenings()
    sql = "SELECT screenings.* FROM screenings WHERE film_id = #{@id}"
    Screening.map_items(sql)
  end

  def tickets()
    sql = "SELECT tickets.* FROM tickets WHERE film_id = #{@id}"
    Ticket.map_items(sql)
  end

  def most_popular_screening
    stuff = []
    film_screenings = screenings()
    for screening in film_screenings
      stuff.push(screening.tickets.length)
    end
    return stuff
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
