local nls_ok, null_ls = pcall(require, "null-ls")
if not nls_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local options = {
    sources = {
        code_actions.eslint,
        formatting.prettier,
        formatting.stylua,
        formatting.eslint,
        diagnostics.eslint,
    },
}

null_ls.setup(options)

local keymap = require("vinevim.utils.keymap")

keymap("n", "<leader>bf", "<Cmd>lua vim.lsp.buf.format({ async = true})<CR>")
