# widechar.nvim

A NeoVim plugin that highlights non-ASCII characters (outside the 0-127 range) in your code.

## Features

- Automatically highlights wide characters (non-ASCII) in lime green with a dark background
- Works across all buffer types
- Lightweight and efficient
- Written in pure Lua

## Installation

### lazy.nvim

```lua
{
    'martinholy/widechar.nvim',
    config = function()
        require('widechar').setup()
    end
}
```

## Usage

Once installed, the plugin automatically highlights any character outside the ASCII range (0-127) whenever you open a buffer.

## Customization

You can customize the colors by passing them to the setup function:

```lua
require('widechar').setup({
    fg = '#afd700',  -- lime green foreground
    bg = '#303030'   -- dark gray background
})
```

## License

MIT
