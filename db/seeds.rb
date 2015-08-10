# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
goog = Stock.create(symbol: 'GOOG', name: 'Google Inc.', price: 557.0)
orcl = Stock.create(symbol: 'ORCL', name: 'Oracle Inc.', price: 41.0)
intc = Stock.create(symbol: 'INTC', name: 'Intel Corp.', price: 31.0)
joe = Portfolio.create(name: 'Joe Doe', ssn: '123-45-6789')
jane = Portfolio.create(name: 'Jane Doe', ssn: '987-65-4321')
Holding.create(portfolio: joe, stock: goog, quantity: 100)
Holding.create(portfolio: joe, stock: orcl, quantity: 100)
Holding.create(portfolio: joe, stock: intc, quantity: 100)
Holding.create(portfolio: jane, stock: goog, quantity: 200)
Holding.create(portfolio: jane, stock: orcl, quantity: 200)
