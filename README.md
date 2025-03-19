# oscura.nvim

A neovim port of Oscura —an unapologetically dark and minimal theme based on Fey. 🌘

original tweet: https://x.com/tcosta_co/status/1902043771493085400

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "jbaldwin/oscura.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- configuration options (see below)
  },
}
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
  "jbaldwin/oscura.nvim",
  config = function()
    require("oscura").setup({
      -- configuration options (see below)
    })
  end
}
```

## Configuration

The colorscheme comes with the following default options:

```lua
{
  cursorline = vim.o.cursorline,
  transparent_background = false, -- Set to true for transparent background
  nvim_tree_darker = false,
  undercurl = true,
  italic_string = false,
  italic_keyword = false,
  italic_type = {
    normal = false,
    builtin = false,
    definition = false,
  },
  italic_constant = {
    builtin = false,
  },
  italic_function = {
    declaration = false,
    call = false,
    method = {
      declaration = false,
      call = false,
    },
  },
  custom_dark_background = nil, -- Set a custom background color
  treesitter_context_bg = true,
  float_borderless = false,
}
```

## Commands

The plugin provides the following commands:

- `OscuraCompile`: Recompile the colorscheme (useful after changing configuration)
- `OscuraColorschemeFile`: Generate a standalone Lua file with the colorscheme (to be used without the plugin)

## Usage

After installation, you can use the colorscheme by adding the following to your configuration:

```lua
vim.cmd.colorscheme "oscura"
```

## License

MIT
