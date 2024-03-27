local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

local opts = {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
  },
  -- formatting.black.with({
  --   condition = function(utils)
  --     return utils.root_has_file('black.conf') -- change file extension if you use something else
  --   end,
  -- }),
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = augroup,
      --   buffer = bufnr,
      --   callback = function()
      --     vim.lsp.buf.format({ bufnr = bufnr })
      --   end,
      -- })
      -- vim.api.nvim_set_keymap('n', '<leader>lo', ':lua require("null-ls").code_action()<CR>', { noremap = true, silent = true })
    end
  end,
}
return opts
