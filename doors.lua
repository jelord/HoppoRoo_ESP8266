srv=net.createServer(net.TCP) 

gpio.mode(0,gpio.INPUT,gpio.FLOAT)
gpio.mode(6,gpio.INPUT,gpio.FLOAT)
gpio.mode(7,gpio.INPUT,gpio.FLOAT)
gpio.mode(8,gpio.INPUT,gpio.FLOAT)
gpio.write(0,gpio.LOW)
gpio.write(6,gpio.LOW)
gpio.write(7,gpio.LOW)
gpio.write(8,gpio.LOW)

srv:listen(8080,function(conn) 
	conn:on("receive",function(conn,payload) 
	print(node.heap())
	
	-- this is for button A --> gpio 16 on the board
	if gpio.read(0)==1 
		then buttonA="1" 
	else buttonA="0" 
	end 
	
	-- this is for button B --> gpio 12 on the board
	if gpio.read(6)==1 
		then buttonB="1" 
	else buttonB="0" 
	end 
	
	-- this is for Button C --> gpio 13 on the board
	if gpio.read(7)==1 
		then buttonC="1" 
	else buttonC="0" 
	end 
	
	-- this is for Button D --> gpio 15 on the board
	if gpio.read(8)==1 
		then buttonD="1" 
	else buttonD="0" 
	end 
	str = "jsonCallBack({\"buttonA\": \"" .. buttonA .. "\",\
		\"buttonB\" : \"" .. buttonB .. "\",\
		\"buttonC\" : \"" .. buttonC .. "\",\
		\"buttonD\" : \"" .. buttonD .. "\"})"
	conn:send(str)
	conn:close() 
	end)
end)