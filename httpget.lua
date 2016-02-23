-- tested on NodeMCU 0.9.5 build 20141222...20150108
-- sends connection time and heap size to http://benlo.com/esp8266/test.php

conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload) print(payload) end )
conn:connect(80,"192.168.0.17")
conn:send("GET /date.sh HTTP/1.1\r\nHost: 192.168.0.17 \r\n"
	.."Connection: keep-alive\r\nAccept: */*\r\n\r\n")
