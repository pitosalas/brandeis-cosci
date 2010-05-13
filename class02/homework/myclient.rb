# Myclient.rb - Pito Salas
# Simple client app that connects to myserver.rb and sends commands to it. When a command 
# "x" is seen, that means that myclient should exit.
#
# To Run:
# ruby myclient.rb
#
require 'socket'

tcp_socket = TCPSocket.open('0.0.0.0', 8888)

loop do
  print "> "
  command_string = gets
  break if command_string =~ /x/
  tcp_socket.puts command_string
  servers_resp = tcp_socket.readline
#  puts "class: #{servers_resp.class}, length: #{servers_resp.length}, content: #{servers_resp}"
  puts servers_resp.to_s
end

