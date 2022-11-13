require_relative '../lib/PeepsRepository'
 
def reset_peeps_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepsRepository do 

  before(:each) do 
    reset_peeps_table
  end 

  it 'return the list of peeps, (added .first method)' do 
    repo = PeepsRepository.new 
    peep = repo.all

    expect(peep.first.id).to eq('1')
    expect(peep.first.peep).to eq ("hi mum!")
  end 
 

  it 'creates a new peep' do 
    repo = PeepsRepository.new 

    peep = Peeps.new 
    peep.peep = 'Hey there!'
    peep.time = '13:01:15'
    repo.create(peep) # => ni
    
    peep = repo.all
    last_chitter = peep.last
    expect(last_chitter.peep).to eq 'Hey there!'
    expect(last_chitter.time).to eq '13:01:15'
  end 
end 
  

