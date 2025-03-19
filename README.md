# Oscura.nvim

A Neovim colorscheme inspired by [Oscura](https://x.com/tcosta_co/status/1902043771493085400) theme from Fey.

## Features

- Dark theme with carefully selected colors
- Support for multiple UI components (NvimTree, Telescope, etc.)
- Support for LSP, Treesitter, Git and more
- Configurable styling options

## Screenshots

(Coming soon)

## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use({
  "jbaldwin/oscura.nvim",
  config = function()
    require("oscura").setup({
      -- options
    })
    vim.cmd([[colorscheme oscura]])
  end,
})
```

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "jbaldwin/oscura.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- options
  },
  config = function(_, opts)
    require("oscura").setup(opts)
    vim.cmd([[colorscheme oscura]])
  end,
}
```

## Configuration

Oscura.nvim comes with these defaults:

```lua
require("oscura").setup({
  style = "default", -- reserved for future styles
  transparent = false, -- Enable transparent background
  terminal_colors = true, -- Set terminal colors
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { bold = false },
    variables = {},
    sidebars = "dark", -- style for sidebars
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help", "terminal", "packer", "NvimTree", "Trouble" },
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false, -- When true, section headers in the lualine theme will be bold
})
```

## License

MIT