require_relative('models/movie')
require_relative('models/performer')
require_relative('models/casting')

require('pry')

Casting.delete_all
Performer.delete_all
Movie.delete_all


movie1 = Movie.new({ 'title' => 'Forest Gump', 'genre' => 'Drama', 'budget' => 10000000})
movie2 = Movie.new({ 'title' => 'Big', 'genre' => 'Comedy', 'budget' => 40000000})
movie3 = Movie.new({ 'title' => 'Die Hard', 'genre' => 'Action', 'budget' => 40000000})
movie4 = Movie.new({ 'title' => 'Sixth Sense', 'genre' => 'Thriller', 'budget' => 40000000})
movie1.save()
movie1.title = "Lincoln"
movie1.update

movie2.save()
movie3.save()
movie4.save()

performer1 = Performer.new({ 'first_name' => 'Tom', 'last_name' => 'Hanks'})
performer1.save()
performer1.first_name = "Sally"
performer1.last_name = "Field"
performer1.update


performer2 = Performer.new({ 'first_name' => 'Bruce', 'last_name' => 'Willis'})
performer2.save()

performer3 = Performer.new({ 'first_name' => 'Daniel', 'last_name' => 'Day-Lewis'})
performer3.save()

performer4 = Performer.new({ 'first_name' => 'James', 'last_name' => 'Spader'})
performer4.save()


casting1 = Casting.new({ 'movie_id' => movie1.id,
  'performer_id' => performer1.id,
  'fee' => 500000})
casting1.save()

casting1.fee = 6000000
casting1.update

casting2 = Casting.new({ 'movie_id' => movie2.id,
  'performer_id' => performer1.id,
  'fee' => 650000})
casting2.save()

casting3 = Casting.new({ 'movie_id' => movie3.id,
  'performer_id' => performer2.id,
  'fee' => 300000})
casting3.save()


casting4 = Casting.new({ 'movie_id' => movie1.id,
  'performer_id' => performer3.id,
  'fee' => 3000000})
  casting4.save()

casting5 = Casting.new({ 'movie_id' => movie1.id,
  'performer_id' => performer4.id,
  'fee' => 500000})
  casting5.save()


# movies = Movie.all
# performers = Performer.all
# castings = Casting.all



binding.pry
nil
