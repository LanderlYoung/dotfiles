require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- prompt_prefix = " ",
    -- selection_caret = " ",
    -- path_display = { "smart" },
    --
    mappings = require("core.utils").load_mappings("telescope")
  }
}

