local wk = require('which-key')

wk.register({
  -- Jump
  j = {
    name = "Jump",
    a = { "<Cmd>lua require('harpoon.mark').add_file()<Cr>", "Add" },
    m = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<Cr>", "Menu" },
  },
  ["1"] = { "<Cmd>lua require('harpoon.ui').nav_file(1) <Cr>", "Jump 1" },
  ["2"] = { "<Cmd>lua require('harpoon.ui').nav_file(2) <Cr>", "Jump 2" },
  ["3"] = { "<Cmd>lua require('harpoon.ui').nav_file(3) <Cr>", "Jump 3" },
  ["4"] = { "<Cmd>lua require('harpoon.term').gotoTerminal(1)<Cr>", "Terminal" },
}, { prefix = "<leader>" })

wk.register({
  -- vista tagbar
  t = {
    name = "Tag bar",
    b = { "<Cmd>Vista!!<Cr>", "Toggle tab bar" },
  },
}, {})
