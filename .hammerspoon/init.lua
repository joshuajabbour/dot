require "wifi"

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
  hs.alert.show("Hello World")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show(hs.wifi.currentNetwork())
  hs.pasteboard.setContents(hs.wifi.currentNetwork())
end)
