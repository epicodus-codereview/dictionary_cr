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
  word = params.fetch('word')
  @word = Word.new({:word => word})
  @word.save()
  redirect('/')
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/add_definition') do
  new_definition = params.fetch('definition')
  definition = Definition.new({:definition => new_definition})
  @word = Word.find(id.to_i())
  @word.add_definition(definition)
  redirect('/word/' + @contact.id().to_s())
end
