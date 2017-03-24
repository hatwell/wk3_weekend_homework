require('pg')
require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

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

customer1 =Customer.new({
  'name' => 'Caroline'
})

customer2 = Customer.new( {
  'name' => 'Dan'
})

ticket1 = Ticket.new({
  'customer_id' => 1,
  'film_id' => '25'
  })

ticket2 = Ticket.new({
  'customer_id' => 2,
  'film_id' => '24'
  })


customer1.save()
customer2.save()

film1.save()
film2.save()

ticket2.save()
ticket1.save()


binding.pry
nil
