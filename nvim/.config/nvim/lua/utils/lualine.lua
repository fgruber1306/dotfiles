-- @module utils.lualine

local M = {}

function M.get_lsps()
  local output = ""
  local clients = vim.lsp.get_active_clients({
    bufnr = vim.api.nvim_get_current_buf(),
  })

  for i, client in pairs(clients) do
    if i == 1 then
      output = output .. client.name
    else
      output = output .. ", " .. client.name
    end
  end

  return output
end

function M.maximize_status()
  return vim.t.maximized and "  Maximized " or ""
end

return M
