vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
--vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--vim.keymap.set("n", "Y", "yg$")
--vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")

--vim.keymap.set("n", "<leader>vwm", function()
--    require("vim-with-me").StartVimWithMe()
--end)
--vim.keymap.set("n", "<leader>svwm", function()
--    require("vim-with-me").StopVimWithMe()
--end)

--greatest remap ever
--vim.keymap.set("x", "<leader>p", "\"_dP")

--next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")

vim.keymap.set("n", "<leader>d", "\"+d")
vim.keymap.set("v", "<leader>d", "\"+d")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "JJ", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("v", "<leader>s", "y:%s/<C-r>\"/<C-r>\"/gI<Left><Left><Left>")

vim.keymap.set("n", "<leader>term", ":bel split<bar>term<cr><c-w>J:resize10<cr>")
vim.keymap.set("t", "jj", "<C-\\><C-n>")
vim.keymap.set("t", "JJ", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>.", ":bnext<cr>")
vim.keymap.set("n", "<leader>,", ":bprev<cr>")
vim.keymap.set("n", "<leader>q", ":bd<cr>")

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
    end
})
