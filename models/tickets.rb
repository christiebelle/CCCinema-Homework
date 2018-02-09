require_relative('../db/sql_runner')

class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id

  def initialize ( options )
    @id = options[id].to_i if options[id]
    @film_id = options['film_id']
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id) VALUES ($1, $2) RETURNING id"
    values = [@film_id, @customer_id]
    film = SqlRunner.run(sql,values).first
    @id = film['id'].to_i
  end

  def delete_item()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE tickets SET (film_id, customer_id, show_time) = ($1, $2, $3) WHERE id = $3"
    values = [@film_id, @customer_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM tickets"
    values = []
    stubs = SqlRunner.run(sql, values)
    result = stubs.map {|stub| Ticket.new(stub)}
    return result
  end

end
