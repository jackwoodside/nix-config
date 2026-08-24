local rule = hl.window_rule

-- Flameshot
rule({
	name = "flameshot-multi-display",
	match = {
		title = "flameshot",
	},
	float = true,
	fullscreen_state = "1 2",
	pin = true,
	move = "0 0",
})
rule({
	name = "flameshot-pin",
	match = {
		title = "flameshot-pin",
	},
	float = true,
	pin = true,
})

-- Fullscreen borderless
rule({
	name = "fullscreen-borderless",
	match = {
		fullscreen = true,
	},
	border_color = "rgb(a6e3a1)",
})
