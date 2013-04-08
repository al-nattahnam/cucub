require 'pan-zmq'
require '../protocol/lib/cucub-protocol.rb'


require "../server/lib/cucub-server.rb"
require "../server/examples/boot.rb"
puts 'Starting server...'
@server = Thread.new {
  begin
    Cucub::Server.instance.start!(:config => "../server/config/protocol.ini", :host => '127.0.0.1')
  rescue Exception => e
    $stdout.puts e.inspect
  end
}

sleep 3

require '../vm/lib/cucub-vm.rb'
require '../vm/examples/boot.rb'

puts 'Starting vm...'
Cucub::VM.instance.boot(:config => "../vm/examples/protocol.ini", :initializer => "../vm/examples/initializer.rb")
Cucub::VM.instance.start!

sleep 5

@request = PanZMQ::Request.new
@request.connect "tcp://127.0.0.1:6441"

@inner_outbound = PanZMQ::Push.new
@inner_outbound.connect "ipc:///tmp/cucub-inner-outbound.sock"

@origin = Cucub::Reference.new(:object_uuid => 1, :class_name => "Engine")
@destination = Cucub::Reference.new(:object_uuid => 2, :class_name => "Core")

