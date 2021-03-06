require('pry-byebug')

require_relative('db/sql_runner')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')
require_relative('models/screenings')

Customer.delete_all
Film.delete_all
Ticket.delete_all
Screening.delete_all


customer1 = Customer.new({
  'name'=>'Christie',
  'funds'=> '25'
  })

customer2 = Customer.new({
  'name'=>'Sara',
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

customer5 = Customer.new({
  'name'=>'Barry',
  'funds'=> '25'
  })

customer6 = Customer.new({
  'name'=>'Kara',
  'funds'=> '25'
  })

customer7 = Customer.new({
  'name'=>'Joe',
  'funds'=> '25'
  })

customer1.save
customer2.save
customer3.save
customer4.save
customer5.save
customer6.save
customer7.save

customer3.name = 'John'
customer3.update

film1 = Film.new({
  'title' => 'WonderWoman',
  'price' => '10'
  })

film2 = Film.new({
  'title' => 'Lego Batman Movie',
  'price' => '8'
  })

film3 = Film.new({
  'title' => 'Life of Pi',
  'price' => '10'
  })

film4 = Film.new({
  'title' => 'Silver Linings Playbook',
  'price' => '10'
  })

film1.save
film2.save
film3.save
film4.save


ticket1 = Ticket.new({
  'film_id' => film1.id,
  'customer_id' => customer2.id
  })

ticket2 = Ticket.new({
  'film_id' => film1.id,
  'customer_id' => customer6.id
  })

ticket3 = Ticket.new({
  'film_id' => film2.id,
  'customer_id' => customer5.id
  })

ticket4 = Ticket.new({
  'film_id' => film3.id,
  'customer_id' => customer1.id
  })

ticket5 = Ticket.new({
  'film_id' => film3.id,
  'customer_id' => customer4.id
  })

ticket6 = Ticket.new({
  'film_id' => film4.id,
  'customer_id' => customer7.id
  })

ticket7 = Ticket.new({
  'film_id' => film3.id,
  'customer_id' => customer3.id
  })


ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save
ticket7.save


screening1 = Screening.new({
  'movie_id' => film1.id,
  'show_time' => '20,00'
  })

screening2 = Screening.new({
  'movie_id' => film1.id,
  'show_time' => '22,00'
  })

screening3 = Screening.new({
  'movie_id' => film2.id,
  'show_time' => '18,00'
  })

screening4 = Screening.new({
  'movie_id' => film2.id,
  'show_time' => '20,00'
  })

screening5 = Screening.new({
  'movie_id' => film3.id,
  'show_time' => '20,30'
  })

screening6 = Screening.new({
  'movie_id' => film3.id,
  'show_time' => '21,30'
  })

screening7 = Screening.new({
  'movie_id' => film4.id,
  'show_time' => '21,00'
  })

screening8 = Screening.new({
  'movie_id' => film4.id,
  'show_time' => '23,00'
  })

screening1.save
screening2.save
screening3.save
screening4.save
screening5.save
screening6.save
screening7.save
screening8.save

binding.pry
nil
