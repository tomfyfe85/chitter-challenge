require_relative 'Peeps'

class PeepsRepository
  def all
    sql = 'SELECT id, peep, time, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    result_set.each do |record|
      peep = Peeps.new
      peep.id = record['id']
      peep.peep = record['peep']
      peep.time = record['time']
      peep.user_id = record['user_id']
      
     peeps << peep
     end 
    return peeps
  end
 
  def create(peeps)
    sql =  'INSERT INTO peeps (peep, time, user_id) VALUES($1, $2, $3);'
    sql_params = [peeps.peep, peeps.time, peeps.user_id]
    DatabaseConnection.exec_params(sql, sql_params)
    return nil
  end 
end  