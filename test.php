<!DOCTYPE html>
<html>
<body>
helloooooo

<?php

echo 'daww';

?>

</body>
</html>

conn:send(string.format("func({ \"door\" : %s, \"door2\" : %s });", door, door2 ))



conn:send("<!DOCTYPE html><html><body>")
	conn:send("<script type=\"application/json\">")
	conn:send(string.format("{ \"door\" : %s, \"door2\" : %s }", door, door2 ))
	conn:send("</script></body></html>")
	conn:close() 
	
jsonCallback({"sites":[{"siteName":"JQUERY4U","domainName":"http://www.jquery4u.com","description":"#1 jQuery Blog for your Daily News, Plugins, Tuts/Tips & Code Snippets."},{"siteName":"BLOGOOLA","domainName":"http://www.blogoola.com","description":"Expose your blog to millions and increase your audience."},{"siteName":"PHPSCRIPTS4U","domainName":"http://www.phpscripts4u.com","description":"The Blog of Enthusiastic PHP Scripters"}]});


	conn:send("{\"sites\":[{\"siteName\":\"JQUERY4U\",\"domainName\":\"http://www.jquery4u.com\",\"description\":\"#1 jQuery Blog for your Daily News, Plugins, Tuts/Tips & Code Snippets.\"}]}")

	conn:send("<!DOCTYPE html><html><body>this is my file<?php header(\"Access-Control-Allow-Origin: *\"); echo 'hellllloooo'; ?></body></html>")
	
	conn:send("jsonCallBack({\"sites\":[{\"siteName\":\"JQUERY4U\",\"domainName\":\
	\"http://www.jquery4u.com\",\"description\":\"#1 jQuery Blog for your Daily \
	News, Plugins, Tuts/Tips & Code Snippets.\"}]})")
	
	conn:send("HTTP/1.1 200 OK\r\n\
	Access-Control-Allow-Origin: * \r\n\
	Content-type: text/html\r\n\
	<!DOCTYPE HTML>\
	<html>\
	<head></head>\
	<body>hellllllllllllllllllllllllllllllllllo</body>\
	</html>")
	conn:on("sent",function(conn) 