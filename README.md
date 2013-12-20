# usecasing-rails

Rails usecase generator 

## Installation

Add this line to your application's Gemfile:

    gem 'usecasing-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install usecasing-rails
    

## Usage

**Generate usecase without dependency**


````
rails generate usecasing FinalizeInvoice
````

**Generate usecase with dependencies**

````
rails generate usecasing FinalizeInvoice ValidateInvoice
````

**Generate with namespace folder**

````
rails generate usecasing Invoices::FinalizeInvoices ValidateInvoice
````



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
