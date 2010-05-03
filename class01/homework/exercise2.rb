# Homework for class 2, JBS Web and Mobile Applications, Summer 2010, Brandeis University
#
# Author: Pito Salas
# Date: April 1, 2010
#
# Description: Fortune Cookie Generator class
#
# Running: 
#       $ ruby exercise2.rb
#
# Expected result:
#       "a fortune"
#       "another fortune"
#
# class Fortune: generates fortune cookie fortunes
#
class Fortune
  
# List of fortunes. Add more if you want
  FORTUNES = ["You will learn Ruby soon", "You will get an A for this course", "The Redsox will win the superbowl"]

# Return a randomly selected fortune from the collection  
  def next_fortune
    FORTUNES[(rand * FORTUNES.length).to_int]
  end
    
end

if __FILE__ == $0 
  f = Fortune.new
  puts f.next_fortune
  puts f.next_fortune
end
    