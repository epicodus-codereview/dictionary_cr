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

post('new_word') do
  word = params.fetch('word')
  @word = Word.new({:word => 'Plato'})
  @word.save()
  erb(:index)
end
