require './client_server'

#puts Core.reference.inspect
core = Core.new
#puts core.reference.inspect

#puts Engine.reference.inspect
engine = Engine.proxy(:respond_to => Engine)
#puts engine.reference.inspect
#
engine.create_vps # respond_to => default reference
engine.create_vps(:respond_to => Core)
engine.create_vps(:respond_to => core)

sleep 2

# A default respond_to is taken from object_specification at configuration file
# at the moment of sending a message.
# If none of this attributes were set, then this message cannot be sent and an error raises.

# A default respond_to can be set also when instantiating a new proxy
#engine = Engine.proxy(:respond_to => Core)
#engine = Engine.proxy(:respond_to => core)
