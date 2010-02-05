#!/usr/bin/env ruby
# TCP/IP Demo

require 'gserver'
require 'pp'

Fortunes = ["You will soon know Ruby", "You will learn how to solve big problems", "It is never too late to learn a new skill"]

class MyServer < GServer
  def initialize(port=10001, *args)
    super(port, *args)
  end
  
  def serve(io)
    io.puts "HELP"
#    io.puts Fortunes[rand*3]
  end
end

nm = ARGV[0] || "myserver"
srv = MyServer.new
srv.audit = true
srv.start

pp srv
sleep 60
puts "bye"