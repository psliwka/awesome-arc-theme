local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local dpi = require("beautiful.xresources").apply_dpi

local themes_path = gears.filesystem.get_themes_dir()

-- inherit default theme
local theme = dofile(themes_path.."default/theme.lua")

-- {{{ colors from https://github.com/NicoHood/arc-theme/blob/master/common/openbox/Arc-Dark/openbox-3/themerc
theme.bg_normal     = "#2f343f"  -- window.inactive.title.bg.color
-- }}}

-- {{{ colors from https://github.com/NicoHood/arc-theme/blob/master/common/gtk-2.0/gtkrc-dark
theme.fg_normal     = "#d3dae3"  -- fg_color

-- a little non-arc-way, but I prefer the focused window to be more distinguishable
theme.bg_focus      = "#5294e2"  -- selected_bg_color
theme.fg_focus      = "#ffffff"  -- selected_fg_color

theme.bg_minimize   = "#3e4350"  -- insensitive_bg_color
theme.fg_minimize   = "#7c818c"  -- insensitive_fg_color
-- }}}

-- {{{ colors from https://github.com/DaveDavenport/rofi-themes/blob/master/Official%20Themes/Arc-Dark.rasi
theme.bg_urgent     = "#a54242"  -- selected-urgent-background
theme.fg_urgent     = "#f9f9f9"  -- selected-urgent-foreground
-- }}}

-- to match with the rest of colorscheme
theme.bg_systray    = theme.bg_normal
theme.border_normal = theme.bg_normal
theme.border_focus  = theme.bg_focus
theme.border_marked = theme.bg_urgent  -- TODO: check when/where is it used

-- nicer snap borders
theme.snap_bg = theme.border_focus
theme.snap_shape = gears.shape.rectangle 

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Recolor titlebar icons:
-- TODO: find a way to show hovered/pressed state nicely
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_normal, "normal"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_normal, "normal", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_normal, "normal", "press"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_focus, "focus"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_focus, "focus", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_focus, "focus", "press"
)

return theme
