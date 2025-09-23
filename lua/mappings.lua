require "nvchad.mappings"
local map = vim.keymap.set

-- Enter command mode
map("n", ";", ":", { desc = "Enter command mode" })

local current_tab = 1
local previous_tab = 1

-- helper function for switching to a buffer by its index
local function switch_to_buffer(i)
  if current_tab == i then
    return
  end

  local ok = pcall(vim.api.nvim_set_current_buf, vim.t.bufs[i])
    
  if ok then
    previous_tab = current_tab
    current_tab = i
  end
end

-- Num to switch to a buffer
for i = 1, 9, 1 do
  map("n", tostring(i), function()
    switch_to_buffer(i)
  end, { desc = string.format("Switch to %s-th buffer", i) })
end

-- Tab to cycle between last two tabs
map("n", "<A-Tab>", function()
  local ok = pcall(function()
    local temp = current_tab
    current_tab = previous_tab
    previous_tab = temp
    vim.api.nvim_set_current_buf(vim.t.bufs[current_tab])
  end)
end, { desc = "Cycle between last two tabs" })

-- Override <Tab> to go to next buffer
map("n", "<Tab>", function()
  local bufs = vim.t.bufs or {}
  if #bufs == 0 then
    return
  end
  local index = vim.fn.index(bufs, vim.api.nvim_get_current_buf())
  local next_index = (index + 1) % #bufs + 1 
  switch_to_buffer(next_index)
end)

-- Override <S-Tab> to go to prev buffer
map("n", "<S-Tab>", function()
  local bufs = vim.t.bufs or {}
  if #bufs == 0 then
    return
  end
  local index = vim.fn.index(bufs, vim.api.nvim_get_current_buf())
  local prev_index = (index - 1 + #bufs) % #bufs + 1 
  switch_to_buffer(prev_index)
end)

-- Save current buffer
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save current buffer" })
