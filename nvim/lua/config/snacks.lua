local M = {}

M.opts = {
  bigfile = { enabled = true },
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  picker = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  -- toggle = {
  --   map = vim.keymap.set, -- keymap.set function to use
  --   which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
  --   notify = true, -- show a notification when toggling
  --   -- icons for enabled/disabled states
  --   icon = {
  --     enabled = " ",
  --     disabled = " ",
  --   },
  --   -- colors for enabled/disabled states
  --   color = {
  --     enabled = "green",
  --     disabled = "yellow",
  --   },
  --   wk_desc = {
  --     enabled = "Disable ",
  --     disabled = "Enable ",
  --   },
  -- },
  styles = {
    notification = {
      -- wo = { wrap = true } -- Wrap notifications
    }
  },
  dashboard = {
    sections = {
      { section = "keys", gap = 0, padding = 2 },
      { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
      -- { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
      function()
        local in_git = Snacks.git.get_root() ~= nil
        local cmds = {
          -- {
          --   title = "Notifications",
          --   cmd = "gh notify -s -a -n5",
          --   action = function()
          --     vim.ui.open("https://github.com/notifications")
          --   end,
          --   key = "n",
          --   icon = " ",
          --   height = 5,
          --   enabled = true,
          -- },
          {
            title = "Open Issues",
            cmd = "gh issue list -L 3",
            key = "i",
            action = function()
              vim.fn.jobstart("gh issue list --web", { detach = true })
            end,
            icon = " ",
            height = 3,
          },
          {
            icon = " ",
            title = "Open PRs",
            cmd = "gh pr list -L 3",
            key = "p",
            action = function()
              vim.fn.jobstart("gh pr list --web", { detach = true })
            end,
            height = 5,
          },
          {
            icon = " ",
            title = "Git Status",
            cmd = "git --no-pager diff --stat -B -M -C",
            height = 5,
          },
        }
        return vim.tbl_map(function(cmd)
          return vim.tbl_extend("force", {
            pane = 2,
            section = "terminal",
            enabled = in_git,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          }, cmd)
        end, cmds)
      end,
      {
        pane = 2,
        section = "terminal",
        cmd = "pokemon-colorscripts -r; sleep .1",
        random = 100,
        height = 20,
        indent = 15,
      }
    }
  },
}

M.keys = {
  -- Top Pickers & Explorer
  { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
  { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
  { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
  { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
  { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
  { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
  -- find
  { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
  { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
  { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
  -- { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
  { "<C-p>",           function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
  { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
  { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
  -- git
  { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
  { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
  { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
  { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
  { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
  { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
  { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
  -- Grep
  { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
  { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
  { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
  { "<leader>fg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
  -- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
  { "<leader>*",       function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
  -- search
  { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
  { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
  { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
  { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
  { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
  { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
  { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
  { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
  { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
  { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
  { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
  { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
  { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
  { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
  { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
  { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
  { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
  { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
  { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
  { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
  { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
  -- LSP
  { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
  { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
  { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
  { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
  -- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
  { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
  { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
  -- Other
  { "<leader>z",       function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
  { "<leader>Z",       function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom" },
  { "<leader>.",       function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
  { "<leader>S",       function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
  { "<leader>n",       function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
  { "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
  { "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
  { "<leader>gB",      function() Snacks.gitbrowse() end,                                      desc = "Git Browse",               mode = { "n", "v" } },
  { "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
  { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
  { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
  { "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
  { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",           mode = { "n", "t" } },
  { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",           mode = { "n", "t" } },
  {
    "<leader>N",
    desc = "Neovim News",
    function()
      Snacks.win({
        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
        width = 0.6,
        height = 0.6,
        wo = {
          spell = false,
          wrap = false,
          signcolumn = "yes",
          statuscolumn = " ",
          conceallevel = 3,
        },
      })
    end,
  },
}

M.init = function()
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      _G.dd = function(...)
        Snacks.debug.inspect(...)
      end
      _G.bt = function()
        Snacks.debug.backtrace()
      end
      vim.print = _G.dd
      Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
      Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
      Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
      Snacks.toggle.diagnostics():map("<leader>ud")
      Snacks.toggle.line_number():map("<leader>ul")
      Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
        "<leader>uc")
      Snacks.toggle.treesitter():map("<leader>uT")
      Snacks.toggle.option("background", { off = "light", on = "dark" }):map("<leader>uh")
      Snacks.toggle.indent():map("<leader>ug")
      Snacks.toggle.dim():map("<leader>uD")
    end,
  })
end

return M
