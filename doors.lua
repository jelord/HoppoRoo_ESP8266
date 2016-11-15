srv=net.createServer(net.TCP) 

gpio.mode(5,gpio.INPUT,gpio.PULLUP)
gpio.mode(6,gpio.INPUT,gpio.PULLUP)
gpio.mode(7,gpio.INPUT,gpio.PULLUP)
gpio.mode(8,gpio.INPUT,gpio.FLOAT) --pulldown

gpio.mode(0,gpio.OUTPUT) --yellow
gpio.mode(1,gpio.OUTPUT) --blue
gpio.mode(2,gpio.OUTPUT) --green
gpio.mode(3,gpio.OUTPUT) --red

srv:listen(8080,function(conn) 
	conn:on("receive",function(conn,payload) 
	print(node.heap())
	
	-- this is for button A --> gpio 14 on the board
	if gpio.read(5)==1 
		then gpio.write(3,gpio.HIGH) 
	else gpio.write(3,gpio.LOW) 
	end 
	
	-- this is for button B --> gpio 12 on the board
	if gpio.read(6)==1 
		then gpio.write(2,gpio.HIGH) 
	else gpio.write(2,gpio.LOW) 
	end 
	
	-- this is for Button C --> gpio 13 on the board
	if gpio.read(7)==1 
		then gpio.write(1,gpio.HIGH)
	else gpio.write(1,gpio.HIGH)
	end 
	
	-- this is for Button D --> gpio 15 on the board
	if gpio.read(8)==1 
		then gpio.write(0,gpio.HIGH)
	else gpio.write(0,gpio.HIGH) 
	end 
	str = "jsonCallBack({\"buttonA\": \"" .. gpio.read(3)  .. "\",\
		\"buttonB\" : \"" .. gpio.read(2) .. "\",\
		\"buttonC\" : \"" ..  gpio.read(1) .. "\",\
		\"buttonD\" : \"" .. gpio.read(0) .. "\"})"
	conn:send(str)
	conn:close() 
	end)
end)
