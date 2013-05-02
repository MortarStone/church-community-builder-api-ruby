# # Project::    TheCity Admin API 
# # File::       the_city.rb
# #
# # Author:: Wes Hays <weshays@gbdev.com> 
# # Link:: https://github.com/weshays/admin-api-ruby
# # Package:: TheCity::Admin


# require File.expand_path( File.dirname(__FILE__) + '/../lib/the_city_admin.rb')

# require 'rubygems'
# require 'rspec'
# require 'ruby-debug'
# require 'date'

# require 'factory_girl'
# Dir.glob(File.dirname(__FILE__) + "/factories/*").each { |f| require f }


# TheCityResponse = Struct.new(:code, :body, :headers)

# RSpec.configure do |config|
#   config.tty = true
#   config.mock_with :rspec
#   config.include FactoryGirl::Syntax::Methods
# end


# def simulate_connection_to_server
#   @the_city = TheCity::AdminApi.new('cf2903151e3213e66fd8080c7d8b65b1d6ccdd31', '5c88b32edda7653c')
# end