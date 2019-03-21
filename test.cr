require "socket"
require "./src/osc-crystal.cr"

server = UDPSocket.new
server.bind "localhost", 8000

client = UDPSocket.new
client.connect "localhost", 8000

m1 = OSC::Message.new("/foo", 0_i32)
puts m1.tag

client.send m1

message, client_addr = server.receive
m2 = OSC::Message.new(message.bytes)
puts m2.address

client.close
server.close
