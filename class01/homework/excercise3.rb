# Simple Server - Pito Salas
#
# This is a very trivial server that listens on port 8888 and simply responds with the time of day at the server.
# 
# To Run:
# ruby simplerver.rb
#
# To test, just go into your browser and go to url: 0.0.0.0:8888
#
require 'socket'               # Get sockets from stdlib

server = TCPServer.open(8888)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  client.puts(Time.now.ctime)  # Send the time to the client
  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}
