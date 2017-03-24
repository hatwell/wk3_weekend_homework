require('pg')
require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

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
  'name' => 'Caroline'
})

customer2 = Customer.new( {
  'name' => 'Dan'
})

customer1.save()
customer2.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })


ticket2.save()
ticket1.save()


binding.pry
nil
