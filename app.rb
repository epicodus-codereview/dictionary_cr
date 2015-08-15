require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @words = Word.all() # use @words instance variable. This is a new variable you're creating here. It should not be the same as the @@words in the class file. You ARE assigning it to the same thing by using the Word.all() class method, but this is a different variable.
  erb(:index)
end

post('/add_word') do
  @word = params.fetch('word')
  @word = Word.new({:word => @word})
  @word.save()
  redirect('/')
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/add_definition') do
  @new_definition = params.fetch('definition')
  word_definition = Definition.new({:definition => @new_definition})
  id = params.fetch('word_id')
  @word = Word.find(id.to_i())
  @word.add_definition(word_definition) # you want to add the definition object itself (you were converting it to a string so it was adding a string not the definition object)
  redirect('/word/' + @word.id().to_s())
end
