require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/PeepsRepository'

DatabaseConnection.connect


class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
 
  get '/signup' do 
   return erb(:all)
  end 

  get '/' do
    repo = ChitterRepo.new
    @peep_list = repo.all
    @peep = params[:peep]
    return erb(:index)
  end
end 



