# README

This application is a little code sample that allows a simple web service to
accept e-commerce items added to a "cart" to be tracked. It consists of a
single endpoint, accepting POST requests to "/item" and will always return a
JSON response containing an auto-generated cart ID in addition to creating a
session cookie containing the same value.

The request should be sent as a JSON payload containing optionally an existing
`cart_id` field, a mandatory `external_id` field, and two optional item fields:
`name` and `value`. If a cookie containing a `cart_id` value is provided, it
will be preferred to a given JSON `cart_id` value. If an item already exists in
our records, then a subsequent request with the same `cart_id` and `external_id`
will update any additional fields.

To run the application:

* Install a recent version of ruby (2.X branch).
* `gem install bundler`
* Clone the repository into a local directory and `cd` into it.
* `bundle install` to install dependencies.
* `bin/rake db:create` to create the local SQLite database.
* `bin/rake db:migrate` to run the initial set of data migrations.
* `bin/rails server` to start the server bound to a local port.

To run the test suite:

* Follow the above directions to setup general development dependencies.
* `bin/rake db:migrate RAILS_ENV=test` to migrate the test SQLite database.
* `bin/rake test` to run the functional controller tests.
