require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize ( options )
    @id = options[id].to_i if options[id]
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql,values).first
    @id = customer['id'].to_i
  end

  def delete_item()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def viewing()
    sql = "SELECT * FROM films INNER JOIN tickets ON films.id = tickets.film_id
    WHERE customer_id = $1;"
    values = [@id]
    seeing = SqlRunner.run(sql, values)
    return seeing.map{|viewing| Film.new(viewing)}
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM customers"
    values = []
    person = SqlRunner.run(sql, values)
    result = person.map {|cust| Customer.new(cust)}
    return result
  end

end
