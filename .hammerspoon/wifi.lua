function ssidChangedCallback()
  newSSID = hs.wifi.currentNetwork()
  newLocation = networks[newSSID]

  if newLocation == "home" and lastLocation ~= "home" then
    -- We just joined a home network
    hs.alert.show(string.format("joined %s network", newLocation))
    hs.audiodevice.defaultOutputDevice():setVolume(75)

  elseif newLocation == "work" and lastLocation ~= "work" then
    -- We just joined a work network
    hs.alert.show(string.format("joined %s network", newLocation))
    hs.audiodevice.defaultOutputDevice():setVolume(0)

    if newSSID == "Culture Foundry Guest" then
      hs.notify.new({ title="Wifi", informativeText="Connected to the guest network" }):send()
    end

  elseif newLocation == nil and newSSID ~= nil then
    -- We just joined another network
    hs.alert.show(string.format("joined %s network", newSSID))
    hs.audiodevice.defaultOutputDevice():setVolume(0)

  elseif newSSID == nil then
    -- We just lost all networks
    hs.alert.show("no wifi")

  end

  lastSSID = newSSID
  lastLocation = newLocation
end

networks = {
  ["(=◕ ٢ ◕=)"] = "home",
  ["(=◕ ٢ ◕=) meow"] = "home",
  ["Culture Foundry"] = "work",
  ["Culture Foundry Guest"] = "work",
}
lastSSID = hs.wifi.currentNetwork()
lastLocation = networks[lastSSID]
wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
