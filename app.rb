require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/chitter_repo'

DatabaseConnection.connect


class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
 
  get '/peeps' do 
    repo = ChitterRepo.new
    @peep_list = repo.all
    return erb(:all)
  end 

  get '/html' do
    @peep = params[:peep]
    return erb(:index)
  end
  
  get '/' do 
    peep = params[:peep]
    return "Hi, #{peep}!!!?"
  end
end 



