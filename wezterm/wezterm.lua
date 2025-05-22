local wezterm = require "wezterm"
local config = wezterm.config_builder()
local action = wezterm.action

-- (here will be added actual configuration)

-- font
config.font = wezterm.font {
  family = 'JetBrainsMonoNL Nerd Font',
  weight = 'Medium',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
}
config.font_size = 14.0
config.line_height = 1.0

-- theme
local function scheme_for_appearance(appearance)
  return "nord"
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

-- padding
config.window_padding = { left = '0.5cell', right = '0.5cell', top = '0.5cell', bottom = '0.5cell' }
config.default_cursor_style = 'BlinkingBar'

-- window style
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
config.window_background_opacity = 0.96
config.macos_window_background_blur = 20

-- maximize on startup
-- https://github.com/wez/wezterm/issues/3299#issuecomment-2145712082
wezterm.on("gui-startup", function(cmd)
  local active = wezterm.gui.screens().active
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():set_position(active.x, active.y)
  window:gui_window():set_inner_size(active.width, active.height)
end)

-- smart-splits
local w = require('wezterm')

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'META' or 'CTRL',
    action = w.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

config.keys = {
  -- move between split panes
  split_nav('move', 'h'),
  split_nav('move', 'j'),
  split_nav('move', 'k'),
  split_nav('move', 'l'),
  -- resize panes
  split_nav('resize', 'h'),
  split_nav('resize', 'j'),
  split_nav('resize', 'k'),

  -- iTerm defaults
  { key = 'd', mods = 'CMD|SHIFT', action = action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'CMD', action = action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'k', mods = 'CMD', action = action.ClearScrollback 'ScrollbackAndViewport' },
  { key = 'w', mods = 'CMD', action = action.CloseCurrentPane { confirm = false } },
  { key = 'w', mods = 'CMD|SHIFT', action = action.CloseCurrentTab { confirm = false } },
  { key = 'LeftArrow', mods = 'CMD', action = action.SendKey { key = 'Home' } },
  { key = 'RightArrow', mods = 'CMD', action = action.SendKey { key = 'End' } },
  { key = 'p', mods = 'CMD|SHIFT', action = action.ActivateCommandPalette }, split_nav('resize', 'l'),
}

return config
