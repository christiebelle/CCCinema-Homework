require('pry-byebug')

require_relative('db/sql_runner')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

Customer.delete_all

customer1 = Customer.new({
  'name'=>'Christie',
  'funds'=> '25'
  })

customer2 = Customer.new({
  'name'=>'Sarah',
  'funds'=> '20'
  })

customer3 = Customer.new({
  'name'=>'Dave',
  'funds'=> '20'
  })

customer4 = Customer.new({
  'name'=>'Oliver',
  'funds'=> '25'
  })

customer1.save
customer2.save
customer3.save
customer4.save



binding.pry
nil
