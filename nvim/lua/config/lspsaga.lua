local M = {}

M.config = function()
  require('lspsaga').setup({
    lightbulb = {
      enable = false,
    },
    rename = {
      in_select = false,
    }
  })
end

return M