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

The default highlight uses:
- Foreground: `#afd700` (lime green)
- Background: `#303030` (dark gray)

You can customize the highlight group `WideChar` in your NeoVim config:

```lua
vim.api.nvim_set_hl(0, 'WideChar', {
  fg = '#your_color',
  bg = '#your_background'
})
```

## License

MIT
