require 'rubygems'
require 'weather_man'

WeatherMan.partner_id = '1191575384'
WeatherMan.license_key = 'c3df3b7f29fe164e'

# Search for a location
# Returns an array of WeatherMan objects
locations = WeatherMan.search('Arlington, MA')

# I happen to know the code for Arlington MA
arlington = WeatherMan.new('USMA0011')

# Fetch only current conditions in metric units
weather = arlington.fetch(:days => 0, :unit => 'm')

# Fetch a 3 day forecast only
weather = arlington.fetch(:days => 3, :current_conditions => false)

# Fetch the current conditions and 5 day forecast in 'standard' units
weather = arlington.fetch

# Print a weather report
puts "Current temperature is: #{weather.current_conditions.temperature}"
puts "But it feels like: #{weather.current_conditions.feels_like}"
puts "Wind speed is: #{weather.current_conditions.wind.speed}"
puts "And the direction is #{weather.current_conditions.wind.direction}"
