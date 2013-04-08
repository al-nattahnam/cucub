require '../../protocol/lib/message'
require '../../protocol/lib/reference'
require 'msgpack'
require 'base64'

# action deberia automaticamente parsearse como symbol, para poder mandar por send

ref = Cucub::Reference.new({:object_uuid => 1, :class_name => "Core"})
ref2 = Cucub::Reference.new({:object_uuid => 2, :class_name => "Engine"})

puts "Message with from, to, respond_to, action, additionals params:\n"
message = Cucub::Message.new("from" => ref, "to" => ref2, "respond_to" => ref, "action" => "state", "additionals" => 1)
puts "UUID: #{message.uuid}"
serialized = message.serialize

message2 = Cucub::Message.parse(serialized)
puts "UUID after parsing: #{message2.uuid}"
message2.unlock(:msgpack)
puts "UUID after unlocking: #{message2.uuid}"
