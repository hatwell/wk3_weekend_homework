class Screening
  attr_accessor :showing_time
  attr_reader :film_id, :id

  def initialize(options)
    @showing_time = options['showing_time']
    @film_id = options['film_id'].to_i
    @id = options['id'].to_i

    def save()
      sql = "INSERT INTO screenings(showing_time, film_id) VALUES ('#{@showing_time}', #{@film_id}) RETURNING *"
      result = SqlRunner.run(sql)
      @id = result.first()['id'].to_i
    end

    def update()
      sql = "UPDATE screenings SET (showing_time, film_id) = ('#{@showing_time}', #{@film_id}) WHERE id = #{@id}"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM screenings WHERE id = #{@id}"
      SqlRunner.run(sql)
    end


end
