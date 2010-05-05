# Myclient.rb - Pito Salas
# Simple client app that connects to myserver.rb and sends commands to it. When a command 
# "x" is seen, that means that myclient should exit.
#
# To Run:
# ruby myclient.rb
#
require 'socket'

tcp_socket = TCPSocket.new('0.0.0.0', 8888)
tcp_socket.puts "Hi there server"
servers_resp = tcp_socket.gets.chomp
puts servers_resp

loop do
  print "> "
  command_string = gets
  break if command_string =~ /x/
  tcp_socket.puts command_string
  servers_resp = tcp_socket.gets.chomp
  puts servers_resp
end

