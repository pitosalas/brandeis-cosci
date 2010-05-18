require 'gserver'

FORTUNES = ["You will learn a lot", "You will get an 'A", "You still have much to learn, Grasshopper"]

class MyServer < GServer
  def initialize(*args)
    super(*args)    
    @@client_id = 0
  end
  
  def serve(io_object)
    @@client_id += 1
    my_client_id = @@client_id
    io_object.sync = true
    
    puts("Client #{@@client_id} attached.")
    loop do
      line = io_object.readline
      case line
      when /^t/
          io_object.puts "The time of day is #{Time.now}"
      when /^x/
        puts "Exiting!"
        break
      when /^f/
        io_object.puts FORTUNES[FORTUNES.length * rand]
      else
        puts "received line #{line}"
        io_object.put "What does #{line} mean anyway?"
      end
    end
  end
end

puts "Starting to listen for a connection on port 8888"
server = MyServer.new(8888)
server.start
server.join