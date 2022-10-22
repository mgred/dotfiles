require('luasnip.loaders.from_vscode').lazy_load()
local luasnip = require('luasnip')
local types = require("luasnip.util.types")

luasnip.config.set_config({
	history = true, --keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", --update changes as you type
  delete_check_events = "TextChanged",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxOrange" } },
			},
		},
		[types.insertNode] = {
			active = {
				virt_text = { { "●", "GruvboxBlue" } },
			},
		},
	},
})
