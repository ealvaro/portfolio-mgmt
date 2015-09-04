About Portfolio Management
==========================

Back in 2012 I was asked by a potential employer to create in one day a very simple, quick Ruby on Rails website demonstrating stocks, users and their portfolios using bootstrap.  It actually took me several days to complete it, but now i have transformed it into a tutorial on how to build a Ruby on Rails project from scratch, with all kinds of concerns; authentication, authorization, testing, etc. This is the project I came up with.
Follow these instructions to get the application up and running. Make sure Ruby is ~> 2.2 and Rails is ~> 4.2.3

Setup
-----
```
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
```
bundle install
rails g bootstrap:install
rails g bootstrap:layout application fixed
rails g rspec:install
```
(optionally delete /test)
```
rails g scaffold portfolio name:string ssn:string
rails g scaffold stock symbol:string name:string price:float
rails g scaffold holding portfolio_id:integer stock_id:integer quantity:integer
```

### create relationships in Holding
```ruby
belongs_to :portfolio
belongs_to :stock
```
### create relationships in Portfolio
```ruby
has_many :holdings, :dependent => :destroy
```
### create relationships in Stock
```ruby
has_many :stocks, :through => :holdings
has_many :holdings
```  
remove public/index.html and create a Home Page
```
rails generate controller Pages home
bundle exec rake assets:precompile
rails g bootstrap:themed portfolios -f
rails g bootstrap:themed stocks -f
rails g bootstrap:themed holdings -f
```
### Database creation
```
rake db:migrate
```
or
```
rake db:reset
```
### Start the webapp
```
rails s
```
Security Concern
----------------

Tests Concern
-------------
### How to run the test suite

### Services (job queues, cache servers, search engines, etc.)

### Deployment instructions

### ...more to come


Please feel free to use this project as an introduction to a Ruby on Rails tutorial, touching different concerns you will need to implement out there in the real world as a developer. 
