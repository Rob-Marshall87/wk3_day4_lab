require_relative('../db/sql_runner')


class Performer
  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = 'INSERT INTO performers(first_name, last_name)
    VALUES ($1, $2)
    RETURNING id'
    values = [@first_name, @last_name]
    performer = SqlRunner.run(sql, values).first
    @id = performer['id'].to_i
  end

  def update
    sql = 'UPDATE performers
          SET first_name = $1, last_name = $2
          WHERE id = $3'
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = 'SELECT * FROM performers'
    performers = SqlRunner.run(sql)
    return performers.map { |performer| Performer.new(performer) }
  end

  def self.delete_all
    sql = 'DELETE FROM performers'
    SqlRunner.run(sql)
  end

  def movies
    sql = 'SELECT movies.*
          FROM movies
          INNER JOIN castings
          ON castings.movie_id = movies.id
          WHERE performer_id = $1'
    values = [@id]
    movies = SqlRunner.run(sql, values)
    return movies.map {|movie| Movie.new(movie)}
  end

end
