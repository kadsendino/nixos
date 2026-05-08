return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.lsp.enable("pyright")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("texlab")
    vim.lsp.enable("rust-analyzer")
  end,
}
