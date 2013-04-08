require '../../protocol/lib/message'
require '../../protocol/lib/reference'
require 'msgpack'
require 'base64'

# action deberia automaticamente parsearse como symbol, para poder mandar por send

ref = Cucub::Reference.new({:object_uuid => 1, :class_name => "Core"})
#ref2 = Cucub::Reference.new({:object_uuid => 2, :class_name => "Engine"})
ref2 = Cucub::Reference.new({:layer => :server})

message = Cucub::Message.new("from" => ref, "to" => ref2, "respond_to" => ref, "action" => "state", "additionals" => 1)
serialized = message.serialize
message.locked?

puts "\nSerialized message:\n#{serialized}"

message2 = Cucub::Message.parse(serialized)
puts "\nLocked message: #{message2.inspect}"

message2.unlock(:msgpack)
puts message2.header.from.to_hash.inspect
puts "Unlocked message:\n#{message2.inspect}"
#puts "action: #{message2.action} | additionals: #{message2.additionals}"
#message2.locked?
#
# testear header.parse
# testear reference.parse
# testear message.parse
