require './client_server'

puts @server.inspect

10.times {
  @request.send_string Cucub::Message.new("from" => @origin, "to" => @destination, "respond_to" => @origin, "action" => "state", "additionals" => (1.to_f / (1 + rand(5)))).serialize
  puts @request.recv_string
}
#request.send_string Cucub::Message.new("from" => origin, "to" => destination, "respond_to" => origin, "action" => "state", "additionals" => 1 + rand(5)).serialize
#puts request.recv_string

#client = Cucub::Client.new(Cucub::VM.instance)
#puts client.inspect

sleep 10

# client = Client(VM)
# engine = client.proxy_for_class("Engine")
# engine.start!
# 
# Proxy -> Client -> VM -> Server -> Server -> VM -> Object
# 
# core = Core.new
# 
# engine = Engine.proxy('192.168.0.115')
# engine.start!
# engine.on_success {|result|
#   puts result
# }
