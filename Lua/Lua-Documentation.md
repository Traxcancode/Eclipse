# Lua Implementation

### These are for beginners, intermediate developers, or expert developers wanting to debug or learn the Eclipse Lua API.
### This was created specifically for those familiar with the ROBLOX exploiting scene, ROBLOX developers, or people who have previously used the LUA fork "LUAU"

## GUI 🗺️
```lua
-- // GUI FUNCTIONS \\ --
local gui_context = gui:create_gui(name = "test tab!", index = 2) -- This can be found inside of Base->Addons->
local tab_1 = gui_context:create_tab(name = "tab1") -- This can be found inside of your GUI context. Index will be what its shown after, lower index = higher priority.
local button_1 = tab_1:create_button(name = "hi", flag = "hello!", callback = your_callback_function) -- flag is used for configs, leave blank and it wont save. Callback will be fired anytime its activated.
local toggle_1 = tab_1:create_toggle(name = "toggle me!!", flag = "toggle_1", default = false, target = your_boolean, callback = your_callback_function) -- Target is optional. To access flags do flags["your_flag"]
local slider_1 = tab_1:create_slider(name = "slider.. heh..", flag = "slider_1", min = 1, max = 2, interval = 1, callback = your_callback_function) -- Min is min value, Max is max value. Interval is how much it goes up by.
local dropdown_1 = tab_1:create_dropdown(name = "dropdown of doom", flag = "dropdown_1", multi = false, values = {"hello!", "hi"}, callback = your_callback_function) -- Callback for single is the value selected, multi shows the two indexes of the values (ex: "hello!" 1, "hi" 2.)
local label_1 = tab_1:create_label(name = "HI!!!", flag = "you dont need one lol", font = "Comic-Sans", font_size = 15) -- Loaded fonts are Arial, Comic sans, and more soon.

-- // METHODS \ -- 
object:hide() -- Makes object invisible
object:show() -- Shows object

title:set_text("status : no!!") -- Sets text for a label.
title:change_font("FontName") -- Sets font
title:change_fontsize(12) -- Changes font size

dropdown:add_option({"hi!", "bye..."}) -- Pushes values to the end of the dropdown
dropdown:remove_option({"hi!"}) -- Removes the value passed
dropdown:replace_options({"im new!"}) -- Replaces all values with the passed ones
dropdown:clear_objects() -- Removes all values

toggle:set_value(true) -- Sets toggle value

button:activate() -- Activates button

slider:set_value(20) -- Sets slider value to select value
slider:set_attribute({min = 20, max = 600}) -- Sets slider min/max to the following
slider:lock() -- Locks slider
slider:unlock() -- Unlocks slider
```

## CONFIGS ⚙️
```lua
local configs = save_config(target = "gui_context_name", file = "config_1.txt") -- Saves them inside of D:\ECLIPSE\Luas\Configs\
local config = load_config(file = "config_1.txt", target = "gui_context_name") -- Loads the select config onto the gui context.
-- Configs will be saved based on flag names, to access flags do flags["your_flag"]
```
## FILESYSTEM 📁
```lua
-- Note : Files allowed are .txt, .cfg, .ecl, .lua
local file_1 = create_file(name = "test.txt", contents = "come here often?", path = "your_folder\\files\\") -- Writes a file to path with name selected and contents.
local file_exists = file_exists(path = "your_folder\\files\\test.txt\\") -- Returns true/false if it exists or not. Works on files too!
local files = list_files(path = "your_folder\\files\\") -- Lists files in a table, ex : {"your_folder\\files\\test.txt", "your_folder\\files\\test2.txt")
local delete_file = delete_file(path = "your_folder\\files\\test.txt") -- Deletes a file permenantly
local folder_1 = create_folder(path = "your_folder\\files\\", name = "configs") -- Creates a folder at set location
```
## RF CONTROLLS 📻
```lua
-- this controls most radio chips (CC1101, NRF24L01)

-- // RF - CC1101 \\ --
radio.set_frequency(frequency = 355000000) -- Only accepted are support frequencies ex: (355/433/868/915MHZZ). These aren't strict look for blueprints on these chips. (CC1101, NRF24L01). 
local data = radio.recieve(timeout = 20, callback = callback_function) -- Timeout is in seconds, callback will pass the data recieved (likely in hex)
radio.transmit(data = 0x7FFFFFFF) -- Pretty self explanatory. If its a string it **will** be encoded in hexadecimal.

-- // BLUETOOTH/WIFI (2.4GHZ) - NRF24L01 \\ --
radio.nrf.transmit(channel = 33, data = 0xDEADBEEF) -- Transmits on bluetooth (2.4ghz)
local data = radio.nrf.recieve(channel = 33) -- Recieves RF data on set channel.
radio.nrf.set_frequency(frequency = 2400000000) -- Sets frequency for NRF chip.
radio.nrf.alternate_channels(channels = {33,22,11,6,7}, interval = 0.1) -- Changes channels every interval (seconds).
```
## IR CONTROLS 📺
```lua
-- this controls the infrared chips.

-- // IR RECIEVER \\ --
local data = ir.recieve(timeout = 5, callback = your_callback_function) -- Passes recieved data (hexadecimal) through function: ex: "0xDEADBEEF"
ir.recieve_multiple(amount = 3) -- Recieves three signals and then sends them back in a table. Ex : "{0x7FFFF, 0x4FFFFFF, 0xCCCCCCC}"

-- // IR TRANSMITTER \\ --
ir.transmit(data = 0x7FFFFFF) -- Transmits signal with data passed through function.
ir.transmit_chain(data = {0x7FFFFFF, 0xDEADBEEF}, interval = 0.01)  -- Transmits signal with data passed through in an interval (seconds)

-- // "TRANSCIEVER" \\ --
local data = ir.replay(amount = 2, return = false) -- Replays things sent, amount of how much values it transmits. Replay means it returns the values it recieved in a table.
```
## FUNCTIONS 🌐
```lua
-- // GLOBALS \\

local data = decrypt(data = 0xCCCCCC, method = "hex") -- Converts it to string. Methods are strictly "hex", "base64"
local data = encrypt(data = "peepee", method = "hex") -- Returns the data but as a hex number or base64. Methods are also strictly "hex", "base64"

-- [ FUNCTIONS ] --

wait(INTERVAL) -- Waits interval amount in seconds
pairs(TABLE) -- Used to sort through tables until it finds a missing spot (ex: nil)
ipairs(TABLE) -- Used to sort through tables even if there is a missing spot.
type(VALUE) -- Says type of VALUE. Ex: "number" "string" or custom.
tonumber(STRING) -- Converts string to number. Ex: "67"->67
tostring(NUMBER) -- Converts number to string. Ex: 67->"67"
print(TEXT) -- Displays in Menu->Debug->Output

-- // MATH LIBRARY \\ --

local value = math.random(1,5) -- Generates and returns a random number through 1,5 (or first being min, second max)
local clamp = math.clamp(value, min, max) -- Generates a value between min and max of value. Example : math.clamp(20,10,15) --> 15
local scale = math.scale(value, min, max) -- Scales a value down. Example : math.scale(150, 0, 200) -- > 0.75

-- More should be added...

```

## METATABLES AND METAMETHODS 😭
```lua
-- // METATABLES \\ --

-- Note : Sorry if there messy it's kind of hard to organize all of these inside of one section.

local Table = {}
local methods = {}

-- Metamethods are "__add", "__sub", "__index", "__newindex", "__div", "__mul", "__type", "__tostring", "__tonumber", and "__iter"
-- These can be used to create custom classes for ease of use.

-- ( INITIALIZING METATABLE ) --

local metatable = setmetatable(Table, methods)

-- To initialize metamethods do methods.__method = function(...). Examples below.

-- ( __ADD ) --

methods.__add = function(...) -- Used for adding. Takes in as many numbers as needed.
  local arguments = {...} -- Stores arguments in a table
  local output = 0
  for _, value in pairs(arguments) do -- Using pairs because there shouldn't be any nil values
    output += value
  end
  return output
end

-- Example of use.

local class = metatable(20) -- Example value, can be anything.
local class2 = metatable(30)

print(class + class2) -- 50. This applies to all metamethods unless directly gaven usage example.

-- (__SUB) --

methods.__sub = function(...) -- Used for subtracting. Takes in as many numbers as needed.
  local arguments = {...}
  local output = 0
  for _, value in pairs(arguments) do
    output -= value
  end
  return output
end

-- (__INDEX) --

local cache_table = {
  ["user_1"] = 777,
  ["mason"] = 67
}

methods.__index = function(idx) -- This only has one argument. This also has a unconventional use case unlike the previous ones.
  print(idx) -- This can be called by doing metatable["VALUE"] or metatable.VALUE.
  if not cache_table[idx] then -- Value doesn't exist in cache table
    return 0
  end
  return cache_table[idx] 
end

-- (__NEWINDEX) --

-- This one is very similar, but not. I will be using the cache_table from the previous example. 

methods.__newindex = function(idx, value) -- This uses a mix of both. metatable["VALUE"] = value, or metatable.value = value.
  if not cache_table[idx] then
    debug.output(data = "Cannot write to nonexistant index "..idx, method = "error")
    return 0
  end

  -- just a quick example --

  if idx:lower() == "mason" and value == 67 then
    debug.output(data = "but it refused...", method = "error")
    return 0
  end

  cache_table[idx] = value -- Sets it to the second argument passed.
end

-- (__DIV) --

-- This one is back to the first two I showed. Except for division.

methods.__div = function(...)
  local arguments = {...}
  local output = 0
  local has_passed = false -- <-- Very important value here!!!
  for _, value in pairs(arguments) do
    if has_passed == false then -- To remember what the last number is. The traditional loop we've previously done won't work here... :(
        has_passed = true
        output = value
        continue -- Do no math.. yet?
    end
    output /= value
  end
end

-- You can activate these like the rest, Example : class / class2 (~0.666667) 

-- (__MUL) --

-- This will follow same as __div (divison metamethod) but different symbol.

methods.__mul = function(...)
  local arguments = {...}
  local output = 0
  local has_passed = false

  for _, value in pairs(arguments) do
    if has_passed == false then
      has_passed = true
      output = value
      continue -- Again, no math... yet?
    end
    output /= value
  end
  return output
end

-- Calling method is same as __div.

-- (__TYPE) --

-- I believe this is a custom one added by me, although ive heard it floating around...?

methods.__type = function() -- No arguments.
  return "class_type"
end

-- This gets fired when calling type(metatable). This is heavily useful for class development.

-- (__TOSTRING) --

-- This is relatively similar to type, exccept the caller is 'tostring'.

methods.__tostring = function()
  -- You can do actual logic here but i'm writing these by hand.
  return "mason67" 
end

-- (__TONUMBER) --

-- This is exactly the same as '__tostring' but instead its 'tonumber'.

methods.__tonumber = function()
  return 67 -- Again, you can do real logic here but i'm not using ChatGPT for these.
end

-- You can call it by doing tonumber(metatable)

-- (__ITER) --

-- This metamethod is very 'special', but is necessary for classes. Return type MUST be a table.

methods.__iter = function()
  return {"mason", 67} -- To state again, you can add logic here... but im a lazy bones!! haha!!! :-)
end

--[[
To call it you can do

for _, value in pairs(metatable)
    -- returns your methods.__iter callback value
end
]]
-- This out of all my docs has taken the longest!
```

## DEBUGGING ⚠️
```lua
debug.output(data = "debug statement #1", method = "output") -- Sends debug statement through output pin. Methods are "output", "warning", "error", and "success"
debug.breakpoint() -- Sets a breakpoint at code
debug.traceback() -- Traces call of function
```
