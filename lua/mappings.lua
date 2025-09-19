require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Ctrl+Num to switch to a buffer
for i = 1, 9, 1 do
  map("n", string.format("<C-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { desc = string.format("Switch to %s-th buffer", i) })
end

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
