About Portfolio Management Project
==========================

Back in 2012 I was asked by a potential employer to create in a couple of days a very simple, quick Ruby on Rails website demonstrating stocks, users and their portfolios using bootstrap look and feel.  It actually took me several days to complete it, but now i have transformed it into a tutorial on how to build a Ruby on Rails project from scratch, with all kinds of concerns; authentication, authorization, testing, etc. This is the project I came up with.
Follow these instructions to get the application up and running. Make sure Ruby is ~> 2.2 and Rails is ~> 4.2.3

Setup
-----
```shell
rails new portfolio-mgmt
cd portfolio-mgmt
```

### Add to gemfile 
```ruby
gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
```
### Execute from shell
```shell
bundle install
rails g bootstrap:install
rails g bootstrap:layout application fixed
rails g rspec:install
```
(optionally delete /test folder for the upcoming test framework)
```shell
rails g scaffold portfolio name:string ssn:string
rails g scaffold stock symbol:string name:string price:float
rails g scaffold holding portfolio_id:integer stock_id:integer quantity:integer
```
### create relationships
in Holding
```ruby
    belongs_to :portfolio
    belongs_to :stock
```
in Portfolio
```ruby
    has_many :holdings, :dependent => :destroy
```
in Stock
```ruby
    has_many :stocks, :through => :holdings
    has_many :holdings
```  
remove public/index.html and create a Home Page
```shell
rails generate controller Pages home
bundle exec rake assets:precompile
rails g bootstrap:themed portfolios -f
rails g bootstrap:themed stocks -f
rails g bootstrap:themed holdings -f
```
### Database creation and migration
```shell
rake db:migrate
```
### Adding test data
Add test data to the seeds.rb file, so you can play around with the website
```ruby
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
```
run the following to populate database with test data
```shell
rake db:seed
```
### Start the webserver
```
rails s
```
Security Concerns
----------------
Must add authentication to the website, so i decided to use the has_secure_password feature that comes with Rails 4.X. So start by adding a User model with a password_digest:string and either a username:string or email:string for login purposes.
```shell
rails g scaffold user first_name:string last_name:string dob:date email:string address:string city:string state:string password_digest:string
rails g migration add_user_id_to_portfolio user_id:int
```
in model User add the authentication feature and a few validations
```ruby
    has_secure_password
	validates :password,:length => { :minimum => 8 }
	validates_confirmation_of :password
	validates :email, presence: true, allow_nil: false, uniqueness: {scope: :email}
    has_many :portfolios
```
create relationships in Portfolio
```ruby
    belongs_to :user
```
convert users into the bootstrap theme
```shell
rails g bootstrap:themed users -f
```
Replace test data in the seeds.rb file with the following
```ruby
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
```

Tests Concern
-------------
Add test data 
### How to run the test suite

### Services (job queues, cache servers, search engines, etc.)

### Deployment instructions

### ...more to come


Please feel free to use this project as an introduction to a Ruby on Rails tutorial, touching different concerns you will need to implement out there in the real world as a developer. 
