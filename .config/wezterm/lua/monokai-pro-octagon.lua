local M = {}

local palette = {
    base = '#282a3a',
    overlay = '#33374b',
    muted = '#696d77',
    text = '#eaf2f1',
    magenta = '#c39ac9',
    yellow = '#ffd76d',
    red = '#ff657a',
    blue = '#6ab0f3',
    green = '#bad761',
    cyan = '#9cd1bb',
    highlight = '#b2b9bd',
}

local active_tab = {
    bg_color = palette.overlay,
    fg_color = palette.text,
}

local inactive_tab = {
    bg_color = palette.base,
    fg_color = palette.muted,
}

function M.colors()
    return {
        foreground = palette.text,
        background = palette.base,
        cursor_bg = palette.highlight,
        cursor_border = palette.highlight,
        cursor_fg = palette.text,
        selection_bg = palette.base,
        selection_fg = palette.text,

        ansi = {
            palette.overlay,
            palette.magenta,
            palette.green,
            palette.yellow,
            palette.cyan,
            palette.green,
            palette.red,
            palette.text,
        },

        brights = {
            palette.muted,
            palette.magenta,
            palette.green,
            palette.yellow,
            palette.cyan,
            palette.green,
            palette.red,
            palette.text,
        },

        tab_bar = {
            background = palette.base,
            active_tab = active_tab,
            inactive_tab = inactive_tab,
            inactive_tab_hover = active_tab,
            new_tab = inactive_tab,
            new_tab_hover = active_tab,
            inactive_tab_edge = palette.muted, -- (Fancy tab bar only)
        },
    }
end

function M.window_frame() -- (Fancy tab bar only)
    return {
        active_titlebar_bg = palette.base,
        inactive_titlebar_bg = palette.base,
    }
end

return M
