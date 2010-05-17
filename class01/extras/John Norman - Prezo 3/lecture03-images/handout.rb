# CSCI E-168, Fall 2009
# Handout for Lecture 3: Demonstrate class definition, object instantiation,
# inheritance, declaration of accessor methods (attr_accessor), etc.

# define a class House
class House
  def initialize(color, num_rooms, num_windows)
    @color, @num_rooms, @num_windows = color, num_rooms, num_windows
  end
  def to_s
    "A #{@color} house with #{@num_rooms} rooms and #{@num_window} windows"
  end
end

module Chimney
  def open_flu
    puts "flu opened"
  end
  def close_flu
    puts "flu closed"
  end
end

class SearsHouse < House
  include Chimney
  attr_accessor :num_parts
  def initialize(*args)
    @num_parts = 2000
    super
  end
  def to_s
    "#{super} and #{@num_parts} parts"
  end
end

sh = SearsHouse.new("white", 8, 16)
puts "#{sh}"
sh.open_flu
