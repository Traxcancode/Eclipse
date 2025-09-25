# Lua Implementation
## GUI
```lua
local gui_context = gui:create_gui("test tab!", index = 2) -- This can be found inside of Base->Addons->. Index will be what its shown after, lower index = higher priority.
local tab_1 = gui_context:create_tab(name = "tab1") -- This can be found inside of your GUI context.
local button_1 = tab_1:create_button(name = "hi", flag = "hello!", callback = your_callback_function) -- flag is used for configs, leave blank and it wont save. Callback will be fired anytime its activated.
local toggle_1 = tab_1:create_toggle(name = "toggle me!!", flag = "toggle_1", target = your_boolean, callback = your_callback_function) -- Target is optional. To access flags do flags["your_flag"]
local slider_1 = tab_1:create_slider(name = "slider.. heh..", flag = "slider_1", min = 1, max = 2, interval = 1, callback = your_callback_function) -- Min is min value, Max is max value. Interval is how much it goes up by.
local dropdown_1 = tab_1:create_dropdown(name = "dropdown of doom", flag = "dropdown_1", multi = false, values = {"hello!", "hi"}, callback = your_callback_function) -- Callback for single is the value selected, multi shows the two indexes of the values (ex: "hello!" 1, "hi" 2.)
local label_1 = tab_1:create_label(name = "HI!!!", flag = "you dont need one lol", font = "Comic-Sans", font_size = 15) -- Loaded fonts are Arial, Comic sans, and more soon.
```
