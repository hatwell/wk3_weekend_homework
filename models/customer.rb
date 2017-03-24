require_relative('../db/sql_runner')
class Customer
  attr_reader :name, :id
  attr_accessor :funds

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_i
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO customers(name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name,funds) = ('#{@name}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON film_id = #{@id} WHERE tickets.customer_id = #{@id}."
    return films = Film.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    return Customer.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    customers = SqlRunner.run(sql)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

end
