-- Lua module for highlighting any character outside 0-127 range

local M = {}

-- Check if highlight group exists, if not create it
local function setup_highlight()
    local hl_exists = vim.fn.hlexists('WideChar') == 1
    if not hl_exists then
        vim.api.nvim_set_hl(0, 'WideChar', {
            fg = '#afd700',
            bg = '#303030'
        })
    end
end

-- Match wide characters in the current buffer
local function match_wide_char()
    local bufnr = vim.api.nvim_get_current_buf()

    -- Only match in listed buffers
    if vim.bo[bufnr].buflisted then
        -- Clear any existing matches for this pattern
        vim.fn.clearmatches()
        -- Add match for characters outside ASCII range (0-127)
        vim.fn.matchadd('WideChar', '[^\\x00-\\x7F]')
    else
        vim.fn.clearmatches()
    end
end

-- Setup the plugin
function M.setup()
    -- Setup highlight group
    setup_highlight()

    -- Create autocommand group
    local group = vim.api.nvim_create_augroup('widechar_match', { clear = true })

    -- Create autocommand to match wide chars on buffer enter
    vim.api.nvim_create_autocmd('BufEnter', {
        group = group,
        pattern = '*',
        callback = match_wide_char,
    })

    -- Match wide chars in current buffer immediately
    match_wide_char()
end

return M
