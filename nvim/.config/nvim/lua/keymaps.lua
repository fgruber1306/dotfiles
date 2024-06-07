-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-z>', '<Nop>', { noremap = true, silent = true }) -- We don't stan this one
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous Diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next Diagnostic message' })
vim.keymap.set('n', '<leader>m', vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })

-- Exit terminal mode in the builtin terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- automatic indenting when entering insert mode
vim.keymap.set({ 'n' }, 'i', function ()
  if #vim.fn.getline('.') == 0 then
    return [["_cc]]
  else
    return 'i'
  end
end, { expr = true, desc = 'Enter insert mode' })

-- Mappings for moving lines in visual mode
-- vim.keymap.set('v', '<S-J>', ":m '>+1<CR>gv=gv", { desc = 'Move line downwards', silent = true })
-- vim.keymap.set('v', '<S-K>', ":m '<-2<CR>gv=gv", { desc = 'Move line upwards', silent = true })

-- New tab
vim.keymap.set('n', 'te', ':tabedit<Return>', opts)
vim.keymap.set('n', 'td', ':tabclose<Return>', opts)
vim.keymap.set('n', 'th', ':tabprev<Return>', opts)
vim.keymap.set('n', 'tl', ':tabnext<Return>', opts)
vim.keymap.set('n', 'to', ':tabnew % <CR>', opts)

-- Focus cursor on screen after big movements
vim.keymap.set({ 'n', 'v' }, '<C-f>', '<C-f>zz', opts)
vim.keymap.set({ 'n', 'v' }, '<C-b>', '<C-b>zz', opts)
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', opts)
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resizing splits
vim.keymap.set('n', '<S-Up>', '<C-w>+')
vim.keymap.set('n', '<S-Down>', '<C-w>-')
vim.keymap.set('n', '<S-Left>', '<C-w><')
vim.keymap.set('n', '<S-Right>', '<C-w>>')

vim.keymap.set('v', '<S-j>', '>+1<CR>gv=gv', opts)
vim.keymap.set('v', '<S-k>', '<-2<CR>gv=gv', opts)

-- Hover Documentation
vim.keymap.set('n', 'K', vim.lsp.buf.hover)

-- Stay in indent mode
vim.keymap.set({ 'n', 'v' }, '<S-Tab>', '<<')
vim.keymap.set({ 'n', 'v' }, '<Tab>', '>>')

-- Buffer mappings
-- vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save' })
-- vim.keymap.set('n', '<leader>W', '<cmd>noa w<cr>', { desc = 'Save (no autocommands)' })
-- vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', { desc = 'Quit' })

