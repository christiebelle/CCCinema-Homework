require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :price, :show_time

  def initialize ( options )
    @id = options[id].to_i if options[id]
    @title = options['title']
    @price = options['price'].to_i
    @show_time = options['show_time'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price, show_time) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @price, @show_time]
    film = SqlRunner.run(sql,values).first
    @id = film['id'].to_i
  end

  def delete_item()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE films SET (title, price, show_time) = ($1, $2, $3) WHERE id = $3"
    values = [@title, @price, @show_time, @id]
    SqlRunner.run(sql, values)
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
