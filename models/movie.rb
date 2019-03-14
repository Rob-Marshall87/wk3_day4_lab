require_relative('../db/sql_runner')


class Movie
  attr_reader :id
  attr_accessor :genre, :title

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = 'INSERT INTO movies(title, genre)
    VALUES ($1, $2)
    RETURNING id'
    values = [@title, @genre]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def update
    sql = 'UPDATE movies
    SET title = $1, genre = $2
    WHERE id = $3'
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = 'SELECT * FROM movies'
    movies = SqlRunner.run(sql)
    return movies.map { |movie| Movie.new(movie)  }
  end

  def self.delete_all
    sql = 'DELETE FROM movies'
    SqlRunner.run(sql)
  end

  def performers
    sql = 'SELECT performers.*
          FROM performers
          INNER JOIN castings
          ON castings.performer_id = performers.id
          WHERE movie_id = $1'
    values = [@id]
    performers = SqlRunner.run(sql, values)
    return performers.map {|performer| Performer.new(performer)}
  end

end
