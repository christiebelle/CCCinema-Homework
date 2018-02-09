require_relative('../db/sql_runner')

class Screening

  attr_reader :id
  attr_accessor :movie_id, :show_time

  def initialize ( options )
    @id = options[id].to_i if options[id]
    @movie_id = options['movie_id']
    @show_time = options['show_time'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (movie_id, show_time) VALUES ($1, $2) RETURNING id"
    values = [@movie_id, @show_time]
    film = SqlRunner.run(sql,values).first
    @id = film['id'].to_i
  end

  def delete_item()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE screenings SET (movie_id, show_time) = ($1, $2) WHERE id = $3"
    values = [@movie_id, @show_time, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM screenings"
    values = []
    movie = SqlRunner.run(sql, values)
    result = movie.map {|show| Screening.new(show)}
    return result
  end

end
