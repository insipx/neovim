local M = {}

---Read a secret at runtime, keeping its contents out of the Nix store.
---@param path string Path to a provisioned secret file; ~ is expanded.
---@return string|nil
function M.read(path)
  local file = io.open(vim.fn.expand(path), "r")
  if not file then
    vim.notify("Secret file unavailable: " .. path, vim.log.levels.WARN)
    return nil
  end

  local value = file:read("*a")
  file:close()
  if not value then
    vim.notify("Could not read secret file: " .. path, vim.log.levels.WARN)
    return nil
  end

  -- Remove line endings added by secret provisioning, preserving other whitespace.
  value = value:gsub("[\r\n]+$", "")
  if value == "" then
    vim.notify("Secret file is empty: " .. path, vim.log.levels.WARN)
    return nil
  end
  return value
end

return M
