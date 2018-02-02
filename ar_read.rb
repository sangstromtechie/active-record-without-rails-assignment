require_relative 'ar.rb'

# SELECT COUNT(*) FROM customers
number_of_customers = Customer.count

puts "The number of rows in the customers table is: #{number_of_customers}"

# SELECT * FROM customers
all_customers = Customer.all

# SELECT * FROM customers LIMIT 1
first_customer = Customer.first

#SELECT * FROM customer BY id DESC LIMIT 1
last_customer = Customer.last

puts first_customer.inspect

#<Customer id: 498,
#        name: "Christopher Hartman",
#     address: "Ap #662-4186 Morbi Ave",
#        city: "Lac La Biche County",
#     country: "Canada",
# postal_code: "J5V 8K0",
#       email: "amet@nisiCum.co.uk",
# province_id: 1,
#  created_at: "2011-11-16 05:31:31",
#  updated_at: "2011-11-16 05:31:31"

# SELECT * FROM customers WHERE id = 498 LIMIT 1
chris = Customer.find(498)

# SELECT * FROM customers WHERE name = 'Christopher Hartman' LIMIT 1
# You get a Customer object.
chris = Customer.find_by(name: 'Christopher Hartman')

puts chris.name

# SELECT * FROM cusomers WHERE name = 'Christopher Hartman'
# You get a Customer *collection*.
chris = Customer.where(name: 'Christopher Hartman')

puts chris[0].name

# SELECT * FROM customers WHERE city = "Winnipeg"
#                         AND name LIKE "a%"
#                         ORDER BY name
#                         LIMIT 5
winnipeggers = Customer.select(:name, :address, :city)
                       .where(city: 'Winnipeg')
                       .where("name LIKE 'a%'")
                       .order(:name)
                       .limit(5)

puts winnipeggers.count

winnipeggers.each do |pegger|
  puts pegger.name
  puts pegger.address
end