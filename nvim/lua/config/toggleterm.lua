return {
  config = function()
    require("toggleterm").setup {
      size = 100,
    }

    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ size = 100, cmd = "lazygit", hidden = true })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
  end
} 