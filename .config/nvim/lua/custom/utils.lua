-- Custom utils
local M = {}

local function dirname(path)
    local strip_dir_pat = '/([^/]+)$'
    local strip_sep_pat = '/$'
    if not path or #path == 0 then
        return
    end
    local result = path:gsub(strip_sep_pat, ''):gsub(strip_dir_pat, '')
    if #result == 0 then
        return '/'
    end
    return result
end

M.border = function(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

M.file_exists = function(file_path)
   local f=io.open(file_path,"r")
   if f~=nil then io.close(f) return true else return false end
end

M.get_python_path = function(workspace)
    if vim.env.VIRTUAL_ENV then
        return vim.env.VIRTUAL_ENV .. '/bin/python'
    end

    if workspace ~= nil then
        for _, pattern in ipairs({'*', '.*', '*/venv'}) do
            local match = vim.fn.glob(workspace .. '/' .. pattern .. '/pyvenv.cfg')
            if match ~= '' then
                return dirname(match) .. '/' .. 'bin/python'
            end
        end
    end

    return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

return M
