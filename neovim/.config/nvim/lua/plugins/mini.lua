return {
	{ -- Collection of various small independent plugins/modules
		"nvim-mini/mini.nvim",
		config = function()
			require("mini.basics").setup({
				options = { basics = false },
			})
			require("mini.extra").setup()

			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = true })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- Highlight certain words and hex colors
			local hipatterns = require("mini.hipatterns")
			local hi_words = MiniExtra.gen_highlighter.words
			hipatterns.setup({
				highlighters = {
					-- Highlight a fixed set of common words. Will be highlighted in any place,
					-- not like "only in comments".
					fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
					hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
					todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
					note = hi_words({ "NOTE" }, "MiniHipatternsNote"),

					-- Highlight hex color string (#aabbcc) with that color as a background
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})

			-- Jump to next/previous single character. It implements "smarter `fFtT` keys"
			-- (see `:h f`) that work across multiple lines, start "jumping mode", and
			-- highlight all target matches. Example usage:
			-- - `fxff` - move *f*orward onto next character "x", then next, and next again
			-- - `dt)` - *d*elete *t*ill next closing parenthesis (`)`)
			require("mini.jump").setup()
			-- Jump within visible lines to pre-defined spots via iterative label filtering.
			-- Spots are computed by a configurable spotter function. Example usage:
			-- - Lock eyes on desired location to jump
			-- - `<CR>` - start jumping; this shows character labels over target spots
			-- - Type character that appears over desired location; number of target spots
			--   should be reduced
			-- - Keep typing labels until target spot is unique to perform the jump
			--
			-- See also:
			-- - `:h MiniJump2d.gen_spotter` - list of available spotters
			require("mini.jump2d").setup()

			-- Session management. A thin wrapper around `:h mksession` that consistently
			-- manages session files. Example usage:
			-- - `<Leader>sn` - start new session
			-- - `<Leader>sr` - read previously started session
			-- - `<Leader>sd` - delete previously started session
			require("mini.sessions").setup()

			local miniclue = require("mini.clue")
			miniclue.setup({
				-- Define which clues to show. By default shows only clues for custom mappings
				-- (uses `desc` field from the mapping; takes precedence over custom clue).
				clues = {
					{ mode = "n", keys = "<Leader>s", desc = "[S]earch" },
					{ mode = "n", keys = "<Leader>g", desc = "[G]it" },
					{ mode = "n", keys = "<Leader>t", desc = "[T]oggle..." },
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					-- This creates a submode for window resize mappings. Try the following:
					-- - Press `<C-w>s` to make a window split.
					-- - Press `<C-w>+` to increase height. Clue window still shows clues as if
					--   `<C-w>` is pressed again. Keep pressing just `+` to increase height.
					--   Try pressing `-` to decrease height.
					-- - Stop submode either by `<Esc>` or by any key that is not in submode.
					miniclue.gen_clues.windows({ submode_resize = true }),
					miniclue.gen_clues.z(),
				},
				-- Explicitly opt-in for set of common keys to trigger clue window
				triggers = {
					{ mode = "n", keys = "<Leader>" }, -- Leader triggers
					{ mode = "x", keys = "<Leader>" },
					{ mode = "n", keys = "\\" }, -- mini.basics
					{ mode = "n", keys = "[" }, -- mini.bracketed
					{ mode = "n", keys = "]" },
					{ mode = "x", keys = "[" },
					{ mode = "x", keys = "]" },
					{ mode = "i", keys = "<C-x>" }, -- Built-in completion
					{ mode = "n", keys = "g" }, -- `g` key
					{ mode = "x", keys = "g" },
					{ mode = "n", keys = "'" }, -- Marks
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },
					{ mode = "n", keys = '"' }, -- Registers
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },
					{ mode = "n", keys = "<C-w>" }, -- Window commands
					{ mode = "n", keys = "z" }, -- `z` key
					{ mode = "x", keys = "z" },
				},
			})
		end,
	},
}
