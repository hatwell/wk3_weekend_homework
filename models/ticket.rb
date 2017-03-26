require_relative('../db/sql_runner')

class Ticket
  attr_reader :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @screening_id = options['screening_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets(customer_id, film_id, screening_id) VALUES (#{@customer_id}, #{@film_id}, #{@screening_id}) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_i) = (#{@customer_id}, #{@film_id}, #{@screening_id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM tickets WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = #{@film_id}"
    return films = Film.map_items(sql)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = #{@customer_id}"
    return customers = Customer.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    return Ticket.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket| Ticket.new(ticket)}
    return result
  end


end
