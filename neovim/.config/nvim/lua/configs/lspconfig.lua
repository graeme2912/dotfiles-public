-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "pyright", "markdown_oxide", "cmake" }


local root_dir = function(fname)
  local util = lspconfig.util
  return util.root_pattern("compile_commands.json")(fname)
      or util.find_git_ancestor(fname)
      or util.path.dirname(fname)
end


-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end


lspconfig.clangd.setup {
  cmd = { "clangd", "--background-index", "--query-driver=~/.espressif/tools/xtensa-esp-elf/**/xtensa-esp-elf/bin/xtensa-esp-elf-g*", "--log=verbose" },
  on_attach = on_attach,
  root_dir = root_dir,
  init_options = {
    compilationDatabaseDirectory = "build",
  },
  filetypes = { "c", "cpp", "h", "hpp" },
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { 'bash-language-server', 'start' },

}

lspconfig.jsonls.setup {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  on_attach = on_attach,
  on_init = on_init,
}
