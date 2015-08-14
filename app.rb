require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @@words = Word.all()
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
  @word = Word.find(id).to_i()
  @word.add_definition(word_definition)
  redirect('/word/' + @word.id().to_s())
end
