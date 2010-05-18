class Fortune
  
  FORTUNES = ["You will learn Ruby soon", "You will get an A for this course", "The Redsox will win the superbowl"]

  def next_fortune
    FORTUNES[(rand * FORTUNES.length).to_int]
  end
    
end

if __FILE__ == $0 
  f = Fortune.new
  puts f.next_fortune
  puts f.next_fortune
end
    