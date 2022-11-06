require_relative '../lib/chitter'

class ChitterRepo
  def all
    sql = 'SELECT id, peep, time_logged FROM chitter_test;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    p result_set
    result_set.each do |record|
      chitter = Chitter.new
      chitter.id = record['id']
      chitter.peep = record['peep']
      chitter.time_logged = record['time_logged']
      
      peeps << chitter
     
    end 
    return peeps
  end
 
  def find(id)
    sql = 'SELECT id, peep, time_logged FROM chitter_test WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    record = result_set[0]
    
    chitter = Chitter.new
    chitter.id = record['id']
    chitter.peep = record['peep']
    chitter.time_logged = record['time_logged']
    return chitter
  end  
  
  def create(chitter)
    sql =  'INSERT INTO chitter_test (peep, time_logged) VALUES($1, $2);'
    sql_params = [chitter.peep, chitter.time_logged]
    DatabaseConnection.exec_params(sql, sql_params)
    return nil
  end 
end  