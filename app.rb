require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
# require('./lib/song')
require('pry')
also_reload('lib/**/*.rb')

get('/test') do
  @something = "this is a variable"
  erb(:whatever)
end