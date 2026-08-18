local mod = "SUPER + "

local bind = hl.bind

local config = hl.config

local exec = hl.dsp.exec_cmd

local focus = hl.dsp.focus

local submap = hl.dsp.submap
local submap_d = hl.define_submap

local window = hl.dsp.window

local workspace = hl.dsp.workspace

local filemanager = "yazi"
local menu = "wofi"
local terminal = "kitty"

-- App launcher
bind(mod .. "SPACE", exec(menu))

-- Brightness
bind("XF86MonBrightnessUp", exec("brightnessctl set 5%+"), { locked = true, repeating = true })
bind("XF86MonBrightnessDown", exec("brightnessctl set 5%-"), { locked = true, repeating = true })

-- File browser
bind(mod .. "W", exec(terminal .. " --class " .. filemanager .. " " .. filemanager))

-- Media
bind("XF86AudioRaiseVolume", exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })
bind("XF86AudioLowerVolume", exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { locked = true, repeating = true })
bind(
	"SHIFT + XF86AudioRaiseVolume",
	exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"),
	{ locked = true, repeating = true }
)
bind(
	"SHIFT + XF86AudioLowerVolume",
	exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
	{ locked = true, repeating = true }
)
bind("XF86AudioMute", exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
bind("XF86AudioPlay", exec("playerctl play-pause"), { locked = true })
bind("XF86AudioPrev", exec("playerctl previous"), { locked = true })
bind("XF86AudioNext", exec("playerctl next"), { locked = true })

-- Mouse
bind(mod .. "mouse:272", window.drag(), { mouse = true })

-- Screenshot
bind("HOME", exec("flameshot gui"))

-- Terminal
bind(mod .. "RETURN", exec(terminal))

-- UI toggle
bind(mod .. "T", function()
	local border_size = hl.config.general.border_size
	if border_size ~= 0 then
		config({ general = { border_size = 0, gaps_in = 0, gaps_out = 0 } })
	else
		config({ general = { border_size = 2, gaps_in = 5, gaps_out = 10 } })
	end
	exec('pkill -SIGUSR1 "waybar"')
end)

-- Windows
bind(mod .. "left", focus({ direction = "left" }))
bind(mod .. "right", focus({ direction = "right" }))
bind(mod .. "up", focus({ direction = "up" }))
bind(mod .. "down", focus({ direction = "down" }))

bind(mod .. "SHIFT + left", window.move({ direction = "left" }))
bind(mod .. "SHIFT + right", window.move({ direction = "right" }))
bind(mod .. "SHIFT + up", window.move({ direction = "up" }))
bind(mod .. "SHIFT + down", window.move({ direction = "down" }))

bind(mod .. "SHIFT + Q", window.close())

bind(mod .. "F", window.fullscreen({ mode = "maximized", action = "toggle" }))
bind(mod .. "SHIFT + F", window.fullscreen({ mode = "fullscreen", action = "toggle" }))

bind(mod .. "SHIFT + SPACE", window.float({ action = "toggle" }))

bind(mod .. "R", submap("resize"))
submap_d("resize", function()
	bind("left", window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	bind("right", window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	bind("up", window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	bind("down", window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	bind("SHIFT + left", window.resize({ x = -1, y = 0, relative = true }), { repeating = true })
	bind("SHIFT + right", window.resize({ x = 1, y = 0, relative = true }), { repeating = true })
	bind("SHIFT + up", window.resize({ x = 0, y = 1, relative = true }), { repeating = true })
	bind("SHIFT + down", window.resize({ x = 0, y = -1, relative = true }), { repeating = true })

	bind("escape", submap("reset"))
end)

-- Workspaces
for i = 1, 9 do
	bind(mod .. i, focus({ workspace = i }))
	bind(mod .. "SHIFT + " .. i, window.move({ workspace = i }))
end

-- bind(mod .. "X", workspace.swap_monitors())

-- -- Zoom
-- bind(mod .. "Z", config({ cursor = { zoom_factor = 3 } }))
-- bind(mod .. "SHIFT + Z", config({ cursor = { zoom_factor = 1 } }))
