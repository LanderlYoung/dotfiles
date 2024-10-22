local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local root_pattern = lspconfig.util.root_pattern

lspconfig.clangd.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "h", "cpp", "cc", "hpp", ".m", ".mm" },
  single_file_support = true,
  root_dir = root_pattern(
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'CMakeLists.txt',
    'compile_flags.txt',
    'configure.ac'
  )
}
