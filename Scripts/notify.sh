#!/bin/bash

# Arguments: title message icon timeout mode
# If mode is 'update' it will update an existing notification with the same title
# Example usage: ~/scripts/notify.sh 'Audio Volume' ${vol} ~/scripts/music.jpg 2 update

awesome-client 'naughty = require("naughty")
local title = "'"$1"'"
local message = "'"$2"'"
local icon = "'$(realpath "$3")'"
local timeout = tonumber("'"$4"'")
local mode = "'"$5"'"
--if mode == "update" then
--  for k, n in ipairs(naughty.active) do
--    if n.title == title then
--      n.message = message
--      return
--    end
--  end
--end
naughty.notify({title = title, text = message, icon = icon, timeout = timeout})'
