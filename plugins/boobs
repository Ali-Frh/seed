do

-- Recursive function
local function getRandomButts(attempt)
  attempt = attempt or 0
  attempt = attempt + 1

  local res,status = http.request("http://api.obutts.ru/noise/1")

  if status ~= 200 then return nil end
  local data = json:decode(res)[1]

  -- The OpenBoobs API sometimes returns an empty array
  if not data and attempt <= 3 then
    print('Cannot get that butts, trying another one...')
    return getRandomButts(attempt)
  end

  return 'http://media.obutts.ru/' .. data.preview
end

local function getRandomBoobs(attempt)
  attempt = attempt or 0
  attempt = attempt + 1

  local res,status = http.request("http://api.oboobs.ru/noise/1")

  if status ~= 200 then return nil end
  local data = json:decode(res)[1]

  -- The OpenBoobs API sometimes returns an empty array
  if not data and attempt < 10 then 
    print('Cannot get that boobs, trying another one...')
    return getRandomBoobs(attempt)
  end

  return 'http://media.oboobs.ru/' .. data.preview
end

local function run(msg, matches)
  local url = nil
  
  if matches[1] == "ممه" then
    url = getRandomBoobs()
  end

  if matches[1] == "!کص" then
    url = getRandomButts()
  end

  if url ~= nil then
    local receiver = get_receiver(msg)
    send_photo_from_url(receiver, url)
  else
    return 'Error getting boobs/butts for you, please try again later.' 
  end
end

return {
  description = "عکس ممه و کص میده", 
  usage = {
    "بزنید ممه تا عکس ممه بگیرید 🔞",
    "بزنید کص تا عکس های کص و کون رو برات بفرستم 🔞"
  },
  patterns = {
    "^!ممه$",
    "^!کص$"
  }, 
  run = run 
}

end
