require_relative 'ar.rb'

puts Customer.count

wally = Customer.new # This is in "Object Land" only
                     # No new row in the customers table yet.

wally.name        = 'Wally Glutton'
wally.address     = '123 Good St'
wally.city        = 'Winnipeg'
wally.email       = 'wglutton@maillinator.com'
wally.country     = 'Canada'
wally.postal_code = 'R3J 2K6'

wally.save

puts wally.inspect

puts Customer.count

daisy = Customer.create(name:     'Daisy Glutton',
                     address:     '123 Good St',
                     city:        'Winnipeg',
                     email:       'dglutton@maillinator.com',
                     country:     'Canada',
                     postal_code: 'R3J 2K6')

puts Customer.count

another_daisy = Customer.new(name: 'Daisy',
                              email: 'dglutton@maillinator.com')

if another_daisy.save
  puts 'This new object is valid. It was saved.'
else
  puts 'This new object is not valid. It was not saved.'
  puts another_daisy.errors.messages.inspect
end