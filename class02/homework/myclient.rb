require 'socket'

tcp_socket = TCPSocket.open('0.0.0.0', 8888)

loop do
  print "> "
  command_string = gets
  break if command_string =~ /x/
  tcp_socket.puts command_string
  servers_resp = tcp_socket.readline
  puts servers_resp.to_s
end

