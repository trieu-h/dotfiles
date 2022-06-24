require("nvim-lsp-installer").setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local nvim_lsp = require('lspconfig')
local saga = require('lspsaga')
local illuminate = require('illuminate')
local uv = vim.loop

saga.init_lsp_saga();

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function lsp_keymaps(bufnr, client) local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<Leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
  end
  vim.cmd [[
      augroup document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
end

local on_attach = function(client, bufnr)
  lsp_keymaps(bufnr, client)
  lsp_highlight_document(client)
end

-- For list of language server install please refer this link
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local servers = { "ocamllsp", "sumneko_lua", "rust_analyzer" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

local ngls_cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  default_node_modules,
  "--ngProbeLocations",
  default_node_modules,
  "--experimental-ivy"
}

nvim_lsp.angularls.setup {
  cmd = ngls_cmd,
  on_attach = on_attach,
  capabilities = capabilities,
  on_new_config = function(new_config)
    new_config.cmd = ngls_cmd
  end
}

vim.api.nvim_set_keymap("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gr", ":Lspsaga rename<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gh", "<Cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ca", ":Lspsaga code_action<CR>", { silent = true })
