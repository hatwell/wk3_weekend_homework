require('pg')
require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

film1 =Film.new({
  'title' => 'Clueless',
  'year_of_release' => 1995,
  'price' => 7.50
})

film2 = Film.new({
  'title' => 'Get Out',
  'year_of_release' => 2017,
  'price' => 10.00
  })

  film1.save()
  film2.save()

customer1 =Customer.new({
  'name' => 'Caroline',
  'funds' => 100
})

customer2 = Customer.new( {
  'name' => 'Dan',
  'funds' => 200
})

screening1 = Screening.new(
'showing_time' => '20:00',
'film_id' => film1.id
)

screening2 = Screening.new({
'showing_time' => '19:30',
'film_id' => film2.id
})

screening3 = Screening.new( {
  'showing_time' => '18:00',
  'film_id' => film1.id
  })
screening1.save()
screening2.save()
screening3.save()

customer1.save()
customer2.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id,
  'screening_id' => screening1.id
  })

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id,
  'screening_id' => screening3.id
  })

  ticket3 = Ticket.new({
    'customer_id' => customer2.id,
    'film_id' => film1.id,
    'screening_id' => screening3.id
    })

ticket3.save()
ticket2.save()
ticket1.save()


binding.pry
nil
