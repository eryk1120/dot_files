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

M.floating_terminal = {

}

M.trouble = {
  n = {
    ["<leader>tx"] = {function() require("trouble").toggle() end, "toggle trouble"},
    ["<leader>tw"] = {function() require("trouble").toggle("workspace_diagnostics") end, "toggle workspace diagnostics"},
    ["<leader>td"] = {function() require("trouble").toggle("document_diagnostics") end, "toggle document diagnostics"},
    ["<leader>tq"] = {function() require("trouble").toggle("quickfix") end, "toggle quickfix"},
    ["<leader>tl"] = {function() require("trouble").toggle("loclist") end, "toggle loclist"},
    ["gR"] = {function() require("trouble").toggle("lsp_references") end, "toggle lsp references"},

  }
}
M.fterm = {
  n = {
    ["<leader>ft"] = {function () require("FTerm").toggle() end, "toggle floating terminal" },
    ["<C-t>"] = {function () require("FTerm").toggle() end, "toggle floating terminal" }
  },
  t = {
    ["<C-t>"] = {function () require("FTerm").toggle() end, "toggle floating terminal" }
  }
}

return M
