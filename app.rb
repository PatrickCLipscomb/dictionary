require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definitions')
require('./lib/words')

get('/') do
  erb(:index)
end

post('/create_word') do
  word = params.fetch('word')
  definition = params.fetch('definition')
  example = params.fetch('example')
  pronunciation = params.fetch('pronunciation')
  alternative_spelling = params.fetch('alternative_spelling')
  origin = params.fetch('origin')
  @new_word = Word.new(:word => word, :pronunciation => pronunciation, :alternative_spelling => alternative_spelling, :origin => origin)
  @new_definition = Definition.new(:definition => definition, :example => example)
  @new_word.add_definition(@new_definition)
  @new_word.save()
  erb(:success)
end

post('/add_another_definition') do
  id = params.fetch('id')
  definition = params.fetch('definition')
  example = params.fetch('example')
  @new_word = Word.find(id)
  @new_definition = Definition.new(:definition => definition, :example => example)
  @new_word.add_definition(@new_definition)
  @new_word.save()
  erb(:success)
end

get('/show_word_list') do
  @words = Word.all()
  erb(:index)
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end
