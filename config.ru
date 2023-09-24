# config.ru
require './app' # This loads your Sinatra application defined in app.rb

# You can run basic a basic Rack server with the "rackup"

# Specify the application to run
run Sinatra::Application
