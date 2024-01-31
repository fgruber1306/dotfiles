local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local which_key = require("which-key")

-- Drop standard LazyVim keymaps
keymap.del("n", "<S-h>")
keymap.del("n", "<S-l>")
keymap.del("n", "[b")
keymap.del("n", "]b")
keymap.del("n", "<leader>bb")
keymap.del("n", "<leader>`")
keymap.del("n", "<leader>ur")
keymap.del({ "i", "x", "n", "s" }, "<C-s>")
keymap.del("n", "<leader>K")
keymap.del("n", "<leader>fn")
keymap.del("n", "<leader>xl")
keymap.del("n", "<leader>xq")
keymap.del("n", "[q")
keymap.del("n", "]q")
keymap.del("n", "[d")
keymap.del("n", "]d")
keymap.del("n", "[e")
keymap.del("n", "]e")
keymap.del("n", "[w")
keymap.del("n", "]w")
keymap.del("n", "<leader>qq")
keymap.del("n", "<leader>L")
keymap.del("n", "<leader><tab><tab>")
keymap.del("n", "<leader><tab>f")
keymap.del("n", "<leader><tab>l")
keymap.del("n", "<leader><tab>[")
keymap.del("n", "<leader><tab>]")
keymap.del("n", "<leader><tab>d")
keymap.del("n", "<leader>|")
keymap.del("n", "<leader>-")
keymap.del("n", "<leader>w-")
keymap.del("n", "<leader>w|")
keymap.del("n", "<leader>wd")
keymap.del("n", "<leader>ww")
keymap.del("n", "<leader>gg")
keymap.del("n", "<leader>gG")
keymap.del("n", "<leader>l")

-- Open Netrw / Oil
keymap.set("n", "<leader>r", "<CMD>Oil<CR>", { desc = "󰘚 Oil" })
keymap.set("n", "<leader>R", "<CMD>Oil --float<CR>", { desc = "󰘚 Oil float" })
-- keymap.set("n", "<leader><C-r>", vim.cmd.Ex, { desc = "󰘚 Netrw" })

-- Open Lazy
which_key.register({
  l = {
    name = "󰒲 Lazy",
    l = { "<cmd>Lazy<cr>", "󰒲 Open Lazy" },
    g = { "<cmd>lazygit<cr>", " lazygit" },
  },
}, { prefix = "<leader>" })

-- Increment / decrement numbers
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "td", ":tabclose<Return>", opts)
keymap.set("n", "th", ":tabprev<Return>", opts)
keymap.set("n", "tl", ":tabnext<Return>", opts)

-- Focus cursor on screen after big movements
keymap.set({ "n", "v" }, "<C-f>", "<C-f>zz", { silent = true })
keymap.set({ "n", "v" }, "<C-b>", "<C-b>zz", { silent = true })
keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { silent = true })
keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { silent = true })
keymap.set({ "n" }, "n", "nzzzv", { silent = true })
keymap.set({ "n" }, "N", "Nzzzv", { silent = true })

-- Handling splits
-- keymap.set({ "n" }, "<C-h>", "<C-w>h")
-- keymap.set({ "n" }, "<C-j>", "<C-w>j")
-- keymap.set({ "n" }, "<C-k>", "<C-w>k")
-- keymap.set({ "n" }, "<C-l>", "<C-w>l")
keymap.set({ "n" }, "<C-Up>", "<C-w>+")
keymap.set({ "n" }, "<C-Down>", "<C-w>-")
keymap.set({ "n" }, "<C-Left>", "<C-w><")
keymap.set({ "n" }, "<C-Right>", "<C-w>>")
keymap.set({ "n" }, "<C-s>", "<C-w>s")
keymap.set({ "n" }, "<C-v>", "<C-w>v")

-- Stay in indent mode
keymap.set({ "n", "v" }, "<S-Tab>", "<<")
keymap.set({ "n", "v" }, "<Tab>", ">>")

-- Buffer mappings
keymap.set("n", "<leader><S-w>", "<cmd>noautocmd w<cr>")
keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })

-- automatic indenting when entering insert mode
keymap.set({ "n" }, "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true, desc = "Enter insert mode" })

-- Mappings for moving lines in visual mode
keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Hover Documentation
keymap.set("n", "K", vim.lsp.buf.hover)
