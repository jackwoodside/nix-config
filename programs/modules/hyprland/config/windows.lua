hl.window_rule({
	name = "flameshot-multi-display",
	match = {
		title = "flameshot",
	},
	float = true,
	fullscreen_state = "1 2",
	pin = true,
	move = "0 0",
})

hl.window_rule({
	name = "flameshot-pin",
	match = {
		title = "flameshot-pin",
	},
	float = true,
	pin = true,
})
