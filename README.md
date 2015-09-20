##Yelp clone application. Week 8 project at Makers Academy

A Yelp clone that lets users view reviewed restaurants and create/edit new restaurant listings.


##Technologies used:

* Ruby On Rails (full stack, Web application framework)
* Tested using RSpec (provides a behaviour driven development framework for the language, allowing to write application scenarios and test them.)
* Shoulda (Ruby gem for testing)
* Devise (Ruby gem which handles building a user model, routes for your users controller
* Poltergeist (headless browser for Capybara based on PhantomJS (scripted, headless browser used for automating web page interaction; provides a JavaScript API enabling automated navigation, screenshots, user behavior and assertions making it a common tool used to run browser-based unit tests in a headless system like a continuous integration environment))



## How to run it

* git clone https://github.com/elinnet/yelp_clone_review.git
* cd yelp_clone_review
* bundle install
* bin/rake db:create
* bin/rake db:migrate
* bin/rails server
* Open your browser on http://localhost:3000/

## How to test it

cd yelp_clone_review
bundle install
rspec

## Further features/functions to add:
* CSS styling
* OmniAuth (authentication system which handles 'Log in with Facebook' feature)
* Paperclip and Amazon Web Services feature for upload of photos
