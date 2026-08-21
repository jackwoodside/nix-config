-- local file = io.open("/etc/hostname")
-- local hostname = io.read("l")
-- io.close(file)

local monitor = hl.monitor

-- if hostname == "europa" then
-- monitor({
-- 	output = "HDMI-A-1",
-- 	mode = "1920x1080@60",
-- 	position = "1920x0",
-- 	scale = 1,
-- })
-- monitor({
-- 	output = "DP-1",
-- 	mode = "1920x1080@60",
-- 	position = "0x0",
-- 	scale = 1,
-- })
-- end
monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "0x300",
	scale = 1,
})
monitor({
	output = "DP-1",
	mode = "3840x2160@60",
	position = "1920x0",
	scale = 1.5,
})
monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
