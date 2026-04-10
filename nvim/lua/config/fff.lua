local M = {}

M.build = function()
  require("fff.download").download_or_build_binary()
end

M.opts = {
  prompt = '> ',
  layout = {
    height = 0.8,
    width = 0.8,
    prompt_position = 'bottom',
    preview_position = 'right',
    preview_size = 0.5,
  },
  preview = {
    enabled = true,
    line_numbers = false,
  },
  frecency = {
    enabled = true,
  },
  history = {
    enabled = true,
  },
  keymaps = {
    move_down = { '<Down>', '<C-n>', '<C-j>' },
    move_up = { '<Up>', '<C-p>', '<C-k>' },
  },
  grep = {
    smart_case = true,
    modes = { 'plain', 'regex', 'fuzzy' },
  },
}

M.keys = {
  { "<leader><space>", function() require('fff').find_files() end,                                          desc = "Find Files (fff)" },
  { "<leader>ff",      function() require('fff').find_files() end,                                          desc = "Find Files (fff)" },
  { "<C-p>",           function() require('fff').find_files() end,                                          desc = "Find Files (fff)" },
  { "<leader>/",       function() require('fff').live_grep() end,                                           desc = "Grep (fff)" },
  { "<leader>fg",      function() require('fff').live_grep() end,                                           desc = "Grep (fff)" },
  { "<leader>sg",      function() require('fff').live_grep() end,                                           desc = "Grep (fff)" },
  { "<leader>fz",      function() require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end, desc = "Fuzzy Grep (fff)" },
  { "<leader>*",       function() require('fff').live_grep({ query = vim.fn.expand("<cword>") }) end,       desc = "Search Current Word (fff)", mode = { "n", "x" } },
  { "<leader>fc",      function() require('fff').find_files({ cwd = vim.fn.stdpath("config") }) end,        desc = "Find Config File" },
}

M.config = function(_, opts)
  require('fff').setup(opts)

  for _, keymap in ipairs(M.keys) do
    local key = keymap[1]
    local action = keymap[2]
    local mode = keymap.mode or "n"
    local desc = keymap.desc
    vim.keymap.set(mode, key, action, { desc = desc, noremap = true, silent = true })
  end
end

return M
