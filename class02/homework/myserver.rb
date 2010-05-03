#!/usr/bin/env ruby
# TCP/IP Demo

require 'gserver'

class MyServer < GServer
  def initialize(*args)
    super(*args)    
    @@client_id = 0
  end
  
  def serve(io)
    # Increment the client ID so each client gets a unique ID
    @@client_id += 1
    my_client_id = @@client_id
    
    io.puts("Welcome to the server, client #{@@client_id}!")
    puts("Client #{@@client_id} attached.")
    io.flush
    loop do
      line = io.readline
      puts "received line #{line}"
    end    
  end
end

server = MyServer.new(8888)
server.audit = true                  # Turn logging on.
server.start
server.join