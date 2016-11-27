srv=net.createServer(net.TCP)

gpio.mode(1,gpio.OUTPUT)
gpio.mode(2,gpio.INPUT,gpio.FLOAT)
gpio.mode(5,gpio.INPUT,gpio.FLOAT)
gpio.mode(6,gpio.INPUT,gpio.FLOAT)
gpio.mode(7,gpio.INPUT,gpio.FLOAT)
gpio.write(1,gpio.LOW)
gpio.write(2,gpio.LOW)
gpio.write(5,gpio.LOW)
gpio.write(6,gpio.LOW)
gpio.write(7,gpio.LOW)

srv:listen(8080,function(conn)
	conn:on("receive",function(conn,payload)
	print(node.heap())

	-- this is for button A --> gpio 16 on the board
	if gpio.read(2)==1 then
		buttonA="1"
		buttonB="0"
		buttonC="0"
		buttonD="0"
        gpio.write(1,gpio.HIGH)

	-- this is for button B --> gpio 12 on the board
	elseif gpio.read(5)==1 then
		buttonA="0"
		buttonB="1"
		buttonC="0"
		buttonD="0"
        gpio.write(1,gpio.HIGH)

	-- this is for Button C --> gpio 13 on the board
	elseif gpio.read(6)==1 then
		buttonA="0"
		buttonB="0"
		buttonC="1"
		buttonD="0"
        gpio.write(1,gpio.HIGH)

	-- this is for Button D --> gpio 15 on the board
	elseif gpio.read(7)==1 then
		buttonA="0"
		buttonB="0"
		buttonC="0"
		buttonD="1"
        gpio.write(1,gpio.HIGH)

	else
		buttonA="0"
		buttonB="0"
		buttonC="0"
		buttonD="0"
        gpio.write(1,gpio.LOW)


	end
	str = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n\{\"buttonA\": \"" .. buttonA .. "\",\"buttonB\" : \"" .. buttonB .. "\",\"buttonC\" : \"" .. buttonC .. "\",\"buttonD\" : \"" .. buttonD .. "\",\"id\" : \"1010\"}"
	conn:send(str)
	conn:close()
	end)
end)
