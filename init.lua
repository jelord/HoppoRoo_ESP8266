-- init.lua
wifi.setmode(wifi.STATION)
wifi.sta.config("rpiwifi","raspberry")
wifi.sta.autoconnect(1)

tmr.alarm(1,2000, 1, function() 
   if wifi.sta.getip()==nil then 
      print(" Wait for IP --> "..wifi.sta.status()) 
   else 
      print("New IP address is "..wifi.sta.getip()) 
      tmr.stop(1) 
      print('load doors')
      dofile('doors.lua')
   end 
end)