local function run(msg)
if msg.text == "hi" then
	return "Hello bb"
end
if msg.text == "Hi" then
	return "Hello honey"
end
if msg.text == "Hello" then
	return "Hi bb"
end
if msg.text == "hello" then
	return "Hi honey"
end
if msg.text == "Salam" then
	return "Salam aleykom"
end
if msg.text == "salam" then
	return "va aleykol asalam"
end
if msg.text == "kir" then
	return "to konet"
end
if msg.text == "کیر" then
	return "تو کونت"
end
if msg.text == "mehran" then
	return "kos nanash :D"
end
if msg.text == "fuck" then
	return "you ! _|_"
end
if msg.text == "telesick" then
	return "jun ?"
end
if msg.text == "bot" then
	return "من ربات نیستم !"
end
if msg.text == "ربات" then
	return "من ربات نیستم !"
end
if msg.text == "بات" then
	return "من ربات نیستم !"
end
if msg.text == "روبات" then
	return "من ربات نیستم !"
end
if msg.text == "Bot" then
	return "Huuuum?"
end
if msg.text == "?" then
	return "Hum??"
end
if msg.text == "Bye" then
	return "Babay"
end
if msg.text == "bye" then
	return "Bye Bye"
end
end

return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
		"^[Hh]i$",
		"^[Hh]ello$",
		"^[Bb]ot$",
		"^[Bb]ye$",
		"^?$",
		"^[kK][iI][rR]$",
		"^[Mm]ehran$",
		"^کیر$",
		"^?$",
		"^[tT]ele[sS]ick$",
		"^[Ss]alam$",
		"^بات$",
		"^ربات$",
		"^روبات$",
		}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}
