local gui = gui:create_gui(name = "jammer") 
local main_tab = gui_context:create_tab(name = "main", index = 1) 
local options_tab = gui_context:create_tab(name = "options", index = 2) 

-- main tab --
local on_off = main_tab:create_toggle(name = "begin", flag = "attack_running", default = false)

-- options tab --
local channel_finder = attack_options:create_dropdown({name = "channel selection", flag = "channel_selection", values = {"random", "itteration"}})

-- main code --

local iter_channels = {}

for i = 0, 80 do
    table.push(iter_channels, i)
end

local channel_index = 0

while true do
  wait()
  if flags["attack_running"] then
    local target_channel = 0
    local channel_selection = channel_finder["channel_selection"]
    if channel_selection == "random" then
      target_channel = math.random(1,80)
    else
      if iter_channels[channel_index] == nil then
        channels_index = 0
        continue
      end
      channel_index += 1
      target_channel = iter_channels[channel_index]
    end
    radio.transmit(channel = target_channel, data = 0xDEADBEEF0CCCCCCCCC)
end
