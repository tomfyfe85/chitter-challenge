# require 'spec_helper'
# require 'rack/test'
# require_relative '../../app'

# describe Application do
#   include Rack::Test::Methods

#   let(:app) { Application.new }

#   context 'GET /' do
#     it 'should include Hi' do 
#       response = get('/', peep: 'tom')

#       expect(response.status).to eq(200)
#       expect(response.body).to include('<h1>Hi tom!</h1>')
#     end 
    
#     it 'should return a list of peeps' do 
#       response = get('/peeps')

#       expect(response.status).to eq(200)
#       expect(response.body).to include('Peep content')
#       expect(response.body).to include('hi mum!')
#     end 
#   end 
# end 
