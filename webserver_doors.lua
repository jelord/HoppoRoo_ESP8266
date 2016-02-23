srv=net.createServer(net.TCP) 

srv:listen(80,function(conn) 
	conn:on("receive",function(conn,payload) 
	print(node.heap()) door="1" 
	if gpio.read(3)==1 
		then door="1" 
	else door="0" 
	end 
	

	if gpio.read(4)==1 
		then door2="1" 
	else door2="0" 
	end 
	str = "jsonCallBack({\"door1\": \"" .. door .. "\",\
		\"door2\" : \"" .. door2 .. "\"})"
	conn:send(str)
	conn:close() 
	end)
end)