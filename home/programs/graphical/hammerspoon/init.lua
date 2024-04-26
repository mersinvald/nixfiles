local util = require "util"

--- Import Spoons ---
hs.loadSpoon("ReloadConfiguration")

--- Automatic Reload ---
spoon.ReloadConfiguration:start()

--- Caffeinate Substitute ---
caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
  if state then
    caffeine:setTitle("AWAKE")
  else
    caffeine:setTitle("SLEEPY")
  end
end

function caffeineClicked()
  setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
  caffeine:setClickCallback(caffeineClicked)
  setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

--- Reduce volume when leaving the home network ---
wifiWatcher = nil
homeSSIDs = { "MNet", "MNet-Access", "MNet-Guest" }
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
  newSSID = hs.wifi.currentNetwork()

  if util.has_value(homeSSIDs, newSSID) and ~util.has_value(homeSSIDs, lastSSID) then
    -- We just joined our home WiFi network
    hs.audiodevice.defaultOutputDevice():setVolume(25)
  elseif ~util.has_value(homeSSIDs, newSSID) and util.has_value(homeSSIDs, lastSSID) then
    -- We just departed our home WiFi network
    hs.audiodevice.defaultOutputDevice():setVolume(0)
  end

  lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
