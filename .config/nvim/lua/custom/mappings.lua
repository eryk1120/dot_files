local M = {}

M.general = {
  n = {
   -- tmux navigator
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
   -- null_ls
   -- does not work xD
    ["<leader>lo"] = { ":lua require('null-ls').code_action()<CR>", "null_ls code format" },

  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>bp"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>qdpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.spelling = {
  n = {
    ["<leader>ty"] = {":setlocal spell!<CR>", "toggle spell"}
  }
}

return M
