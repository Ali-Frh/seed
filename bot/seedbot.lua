
    "weather",
    "goftar",
    "plugins",
    "boobs",
    "onservice",
    "inrealm",
    "ingroup",
    "inpm",
    "banhammer",
    "stats",
    "anti_spam",
    "owners",
    "arabic_lock",
    "set",
    "get",
    "broadcast",
    "download_media",
    "davat",
    "all",
    "leave_ban",
    "admin"
    },
    sudo_users = {25866548},--Sudo users
    disabled_channels = {},
    moderation = {data = 'data/moderation.json'},
    about_text = [[ Paradise Bot V 8.5
Coding By SikkTir Mirza and Ali.Destroyer
@ShopBuy
Special thanks to
kingjan123
Pooria Shadow
Matin Shadow
mohammad tictic
All Right Reserved !
]],
    help_text_realm = [[
کد های گپ اصلی

!creategroup [Name]
ساخت گروه

!createrealm [Name]
ساخت گپ اصلی

!setname [Name]
تنظیم اسم گپ اصلی

!setabout [GroupID] [Text]
تنظیم متن درباره

!setrules [GroupID] [Text]
تنظیم قوانین گروه

!lock [GroupID] [setting]
قفل تنظیمات گروه

!unlock [GroupID] [setting]
بازکردن تنظیمات گروه

!wholist
لیست اعضا

!who
ارسال لیست اعضا در یک فایل

!type
تنظیم مدل گروه

!kill chat [GroupID]
حذف همه اعضای گروه

!kill realm [RealmID]
حذف همه ی اعضای گپ اصلی

!addadmin [id|username]
اضافه کردن مدیر (فقط مالک

!removeadmin [id|username]
حذف مدیر *فقط مالک

!list groups
لیست گروه ها

!list realms
لیست گپ های اصلی

!log
دریافت لیست چت های گروه حاضر

بگو [text]
بگو Hello !
ارسال پیام شما به همه
فقط مالک این کد را می تواند استفاده کند

!bc [group_id] [text]
!bc 123456789 Hello !
پیام مورد نظر شما به گروه میرود [group_id]


شما می توانید دستورات را هم با ! و هم با / بزنید


فقط مدیران و مالک می توانند ربات در گروه های قفل بیاورند


فقط مقام های بالاتر از کمکی میتوانند از دستورات زیر استفاده کنند
 kick,ban,unban,newlink,setphoto,setname,lock,unlock,set rules,set about and settings commands

فقط سرگروه به بالا میتواند دستورات زیر را اجرا کند
 res, setowner, commands
]],
    help_text = [[
Commands list :

!kick [username|id]
می توانید با ریپلی هم کیک کنید

!ban [ username|id]
با ریپلی هم میشود

!unban [id]
با ریپلی هم میشود
!who
لیست اعضا

!modlist
لیست کمکی ها

!promote [username]
کمکی کردن کسی

!demote [username]
خلع مقام کردن

خروج از گروه

!about
درباره ی گروه

!setphoto
تنظیم عکس گروه

!setname [name]
تنظیم اسم گروه

!rules
قوانین گروه

!id
فهمیدن ایدی گروه یا فردی با ریپلی کردن

!help
همین پیام

!lock [member|name|bots|leave]	
قفل کردن [اعضا|اسمbربات هاlخروج 

!unlock [member|name|bots|leave]
بازکردن موارد قفل شده

!set rules <text>
تنظیم قوانین

!set about <text>
تنظیم متن درباره

!settings
تنظیمات

!newlink
لینک جدید

!link
ارسال لینک

!owner
فهمیدن سرگروه

!setowner [id]
تنظیم سرگروه

!setflood [value]
تنظیم مقدار حداکثر اسپم

!stats
وضعیت گروه (ارسال پیام کاربران)

!save [value] <text>
ذخیره ی مقدار

!get [value]
دریافت مقدار ذخیره شده

!clean [modlist|rules|about]
حذف کردن

!res [username]
فهمیدن اسکم و ایدی شخص
"!res @username"

!log
دریافت لاگ های گروه

!banlist
لیست بن شده ها

شما کد ها را هم میتوانید با ! انجام دهید هم با /


فقط مدیر گروه میتواند ربات ها را درگروه اد کند

سوال دارید ؟
@ShopBuy

]]
  }
  serialize_to_file(config, './data/config.lua')
  print('saved config into ./data/config.lua')
end

function on_our_id (id)
  our_id = id
end

function on_user_update (user, what)
  --vardump (user)
end

function on_chat_update (chat, what)

end

function on_secret_chat_update (schat, what)
  --vardump (schat)
end

function on_get_difference_end ()
end

-- Enable plugins in config.json
function load_plugins()
  for k, v in pairs(_config.enabled_plugins) do
    print("Loading plugin", v)

    local ok, err =  pcall(function()
      local t = loadfile("plugins/"..v..'.lua')()
      plugins[v] = t
    end)

    if not ok then
      print('\27[31mError loading plugin '..v..'\27[39m')
      print(tostring(io.popen("lua plugins/"..v..".lua"):read('*all')))
      print('\27[31m'..err..'\27[39m')
    end

  end
end


-- custom add
function load_data(filename)

	local f = io.open(filename)
	if not f then
		return {}
	end
	local s = f:read('*all')
	f:close()
	local data = JSON.decode(s)

	return data

end

function save_data(filename, data)

	local s = JSON.encode(data)
	local f = io.open(filename, 'w')
	f:write(s)
	f:close()

end

-- Call and postpone execution for cron plugins
function cron_plugins()

  for name, plugin in pairs(plugins) do
    -- Only plugins with cron function
    if plugin.cron ~= nil then
      plugin.cron()
    end
  end

  -- Called again in 2 mins
  postpone (cron_plugins, false, 120)
end

-- Start and load values
our_id = 0
now = os.time()
math.randomseed(now)
started = false
