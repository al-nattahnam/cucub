require './client_server'

#@server_ref = Cucub::Reference.new(:layer => :server)

#message = Cucub::Message.new("from" => @origin, "to" => @server_ref, "action" => "register", "additionals" => [Cucub::VM.instance.uid, @origin.class_name])
#puts message.inspect

#@inner_outbound.send_string message.serialize

sleep 5
