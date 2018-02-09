require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize ( options )
    @id = options[id].to_i if options[id]
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql,values).first
    @id = film['id'].to_i
  end

  def delete_item()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def movie_goers()
    sql = "SELECT * FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id
    WHERE film_id = $1;"
    values = [@id]
    viewers = SqlRunner.run(sql, values)
    return viewers.map{|viewer| Customer.new(viewer)}
  end

  def numbers()
    sql = "SELECT * FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id
    WHERE film_id = $1;"
    values = [@id]
    attendees = SqlRunner.run(sql, values)
    return attendees.map{|nums| Customer.new(nums)}.length
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM films"
    values = []
    movie = SqlRunner.run(sql, values)
    result = movie.map {|show| Film.new(show)}
    return result
  end

end
