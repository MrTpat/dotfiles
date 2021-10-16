local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t') -- get currentdir for config data arg
local coq = require "coq"
local config = {
  -- The command that starts the language server
  cmd = {'/home/tilak/.config/nvim/lua/ftplugin/java-lsp.sh'},
  root_dir = require('jdtls.setup').find_root({'pom.xml'}),
  on_attach = on_attach
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
}
require('jdtls').start_or_attach(coq.lsp_ensure_capabilities(config))
