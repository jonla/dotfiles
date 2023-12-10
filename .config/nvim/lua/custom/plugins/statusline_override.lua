local fn = vim.fn
local sep_style = vim.g.statusline_sep_style
local separators = (type(sep_style) == "table" and sep_style)
  or require("nvchad_ui.icons").statusline_separators[sep_style]
local sep_l = separators["left"]
local sep_r = separators["right"]

local st_modules = require "nvchad_ui.statusline.modules"

local moons = {"", "", "", "", "", "", "", "", "", "", "", "", "", "", ""}
-- local moons = {"", "", "", "", "", "", "", "", "", "", "", "", "", ""}

return {
    cursor_position = function()
        local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "

        local current_line = fn.line "."
        local current_col = fn.col "."
        local total_line = fn.line "$"
        local moon_idx = math.modf((current_line / total_line) * (#moons - 1)) + 1
        -- local text = math.modf((current_line / total_line) * 100) .. tostring "%%"

        -- text = (current_line == 1 and "Top") or text
        -- text = (current_line == total_line and "Bot") or text

        return left_sep .. "%#St_pos_text#" .. " " .. current_line .. ":" .. current_col .. " " .. moons[moon_idx] .. " "
    end,
}
