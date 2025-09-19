require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

local current_tab = 1, previous_tab = 0

-- Num to switch to a buffer
for i = 1, 9, 1 do
  map("n", tostring(i), function()
    previous_tab = current_tab
    current_tab = i
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { desc = string.format("Switch to %s-th buffer") })
end

-- Tab to cycle between last two tabs
map("n", "<tab>", function()
  local temp = current_tab
  current_tab = previous_tab
  previous_tab = temp
  vim.api.nvim_set_current_buf(vim.t.bufs[i])
end, { desc = "Cycle between last two tabs" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
