hl.config({
	general = {
		border_size = 2,
		col = {
			active_border = "rgb(cdd6f4)",
			inactive_border = "rgb(585b70)",
		},
		gaps_in = 5,
		gaps_out = 10,
		snap = {
			enabled = true,
		},
	},

	cursor = {
		inactive_timeout = 3,
		zoom_detached_camera = false,
	},

	decoration = {
		blur = {
			enabled = false,
		},
		shadow = {
			enabled = false,
		},
	},

	dwindle = {
		force_split = 2,
		smart_resizing = false,
	},

	ecosystem = {
		no_donation_nag = true,
		no_update_news = true,
	},

	misc = {
		background_color = "rgb(1e1e2e)",
		disable_autoreload = true,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},

	xwayland = {
		force_zero_scaling = true,
	},
})
