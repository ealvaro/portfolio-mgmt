About Portfolio Management
==========================

In 2012 I was asked by a potential employer to create in one day a very simple, quick Ruby on Rails website demonstrating stocks, users and portfolios.  This is the project I came up with.
Follow these instructions to get the application up and running. Make sure Ruby is ~> 2.2 and Rails is ~> 4.2.3

Setup
-----
'''
rails new portfolio-mgmt
cd portfolio-mgmt
'''

### Add to gemfile 
'''
gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
'''
### Execute from shell
'''
bundle install
rails g bootstrap:install
rails g bootstrap:layout application fixed
rails g rspec:install
'''
(optionally delete /test)
'''
rails g scaffold portfolio name:string ssn:string
rails g scaffold stock symbol:string name:string price:float
rails g scaffold holding portfolio_id:integer stock_id:integer quantity:integer
'''

### create relations in Holding
'''
belongs_to :portfolio
belongs_to :stock
'''
### create relations in Portfolio
'''
has_many :holdings, :dependent => :destroy
'''
### create relations in Stock
'''
has_many :stocks, :through => :holdings
has_many :holdings
'''  
### added some spec tests.
### remove public/index.html
### Create a Home Page
'''
rails generate controller Pages home
bundle exec rake assets:precompile
rails g bootstrap:themed portfolios -f
rails g bootstrap:themed stocks -f
rails g bootstrap:themed holdings -f
'''
### Database creation
'''
rake db:migrate
'''
or rake db:reset
### Start the webapp
'''
rails s
'''
### Database initialization

# How to run the test suite

# Services (job queues, cache servers, search engines, etc.)

# Deployment instructions

# ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
