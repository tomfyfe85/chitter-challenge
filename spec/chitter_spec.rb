require_relative '../lib/chitter_repo'
 
def reset_chitter_test_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe ChitterRepo do 

  before(:each) do 
    reset_chitter_test_table
  end 

  it 'return the list of chitter, (added .first method)' do 
    repo = ChitterRepo.new 
    chitter = repo.all

    expect(chitter.length).to eq(2)
    expect(chitter.first.id).to eq('1')
    expect(chitter.first.peep).to eq ("another peep")
  end 
 
  it 'returns a single chitter and info from id = "1"' do 
   repo = ChitterRepo.new
   chitter = repo.find(1)
   expect(chitter.peep).to eq('another peep')
   expect(chitter.time_logged).to eq('23.08')
  end 


  it 'creates a new peep' do 
    repo = ChitterRepo.new 

    chitter = Chitter.new 
    chitter.peep = 'Hey there!'
    chitter.time_logged = 23.15
    repo.create(chitter) 
    chitter = repo.all
    last_chitter = chitter.last
    expect(last_chitter.peep).to eq 'Hey there!'
    expect(last_chitter.time_logged).to eq '23.15'
  end 
end 
  

