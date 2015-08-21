# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
joe = User.create(first_name: 'Joe', last_name: 'Doe', dob: '1955-03-03', email: 'joe@acme.com', address: '123 Main St', city: 'My City', state: 'FL', password: 'secret123', password_confirmation: 'secret123')
jane = User.create(first_name: 'Jane', last_name: 'Doe', dob: '1958-05-05', email: 'jane@acme.com',  address: '123 Main St', city: 'My City', state: 'FL', password: 'secret123', password_confirmation: 'secret123')
goog = Stock.create(symbol: 'GOOG', name: 'Google Inc.', price: 557.0)
orcl = Stock.create(symbol: 'ORCL', name: 'Oracle Inc.', price: 41.0)
intc = Stock.create(symbol: 'INTC', name: 'Intel Corp.', price: 31.0)
ret = Portfolio.create(user: joe, name: 'Joe Retirement', ssn: '123-45-6789')
inv = Portfolio.create(user: jane, name: 'Jane Investment', ssn: '987-65-4321')
Holding.create(portfolio: ret, stock: goog, quantity: 100)
Holding.create(portfolio: ret, stock: orcl, quantity: 100)
Holding.create(portfolio: ret, stock: intc, quantity: 100)
Holding.create(portfolio: inv, stock: goog, quantity: 200)
Holding.create(portfolio: inv, stock: orcl, quantity: 200)

