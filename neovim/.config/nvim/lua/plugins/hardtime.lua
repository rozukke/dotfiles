return {
	{
		"m4xshen/hardtime.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"folke/snacks.nvim",
		},
		opts = {
			allow_different_key = true,
			callback = function(msg) require("snacks").notifier.notify(msg) end,
			restriction_mode = "hint",
			restricted_keys = {
				['<Up>'] = { 'n', 'x' },
				['<Down>'] = { 'n', 'x' },
				['<Left>'] = { 'n', 'x' },
				['<Right>'] = { 'n', 'x' },
			},
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
