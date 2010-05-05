# MyServer.rb - Pito Salas
# Simple client app that accepts connections on port 8888. If the incoming message is
# t - returns the time
# c - returns a fortune cookie
# x - the server exists 
#
# To Run:
# ruby myserver.rb
#

require 'gserver'

FORTUNES = ["You will learn a lot", "You will get an 'A", "You still have much to learn, Grasshopper"]

class MyServer < GServer
  def initialize(*args)
    super(*args)    
    @@client_id = 0
  end
  
  def serve(io_object)
    # Increment the client ID so each client gets a unique ID
    @@client_id += 1
    my_client_id = @@client_id
    io_object.sync = true
    
    io_object.puts("Welcome to the server, client #{@@client_id}!")
    puts("Client #{@@client_id} attached.")
    loop do
      line = io_object.readline
      case line
      when /t/
          io_object.puts "The time of day is #{Time.now}"
      when /x/
        puts "Exiting!"
        break
      when /f/
        io_object.puts FORTUNES[FORTUNES.length * rand]
      else
        puts "received line #{line}"
      end
    end
  end
end

server = MyServer.new(8888)
server.start
server.join