require "../server/lib/cucub-server.rb"
require "../server/examples/boot.rb"
server = Thread.new {
  Cucub::Server.instance.start!(:config => "../server/config/protocol.ini", :host => '127.0.0.1')
}
server.join
