require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "clangd",
  "pyright",
  "rust_analyzer",
  "ts_ls",
  "nil_ls",
  "lua_ls"
}

vim.lsp.enable(servers)

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
  function(server_name) -- default
    lspconfig[server_name].setup({})
  end,
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      cmd = { vim.fn.exepath("lua-language-server") }, -- use nix binary when present
    })
  end,
  ["clangd"] = function()
    lspconfig.clangd.setup({
      cmd = { vim.fn.exepath("clangd") }, -- use nix binary if available
    })
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers 
