return {
	{
		"m4xshen/hardtime.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"folke/snacks.nvim",
		},
		opts = {
			callback = require("snacks").notifier.notify,
			disabled_keys = {
				["<Up>"] = false,
				["<Down>"] = false,
				["<Left>"] = false,
				["<Right>"] = false,
			},
			hints = {
				["[dcyvV][ia][%(%)]"] = {
					message = function(keys)
						return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
					end,
					length = 3,
				},
				["[dcyvV][ia][%{%}]"] = {
					message = function(keys)
						return "Use " .. keys:sub(1, 2) .. "B instead of " .. keys
					end,
					length = 3,
				},
			},
		},
	},
}
