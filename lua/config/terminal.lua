local M = {}

local state = {
  float = { buf = nil, win = nil },
  split = { buf = nil, win = nil },
}

local function valid_win(win)
  return win and vim.api.nvim_win_is_valid(win)
end

local function valid_buf(buf)
  return buf and vim.api.nvim_buf_is_valid(buf)
end

local function notify(message, level)
  vim.notify(message, level or vim.log.levels.INFO, { title = "oc-2 terminal" })
end

local function project_root()
  local ok, root = pcall(function()
    return LazyVim.root()
  end)

  if ok and root and root ~= "" then
    return root
  end

  return vim.uv.cwd()
end

local function buffer_dir()
  local name = vim.api.nvim_buf_get_name(0)
  if name == "" then
    return vim.uv.cwd()
  end
  return vim.fs.dirname(name)
end

local function resolve_cwd(scope)
  if scope == "root" then
    return project_root()
  end
  return buffer_dir()
end

local function set_terminal_buffer_name(buf, kind, cwd)
  local label = vim.fn.fnamemodify(cwd, ":~")
  pcall(vim.api.nvim_buf_set_name, buf, string.format("oc2://terminal/%s/%s", kind, label))
end

local function start_shell(buf, cwd, kind)
  vim.bo[buf].bufhidden = "hide"
  vim.bo[buf].swapfile = false
  vim.fn.termopen(vim.o.shell, { cwd = cwd })
  set_terminal_buffer_name(buf, kind, cwd)
  vim.cmd("startinsert")
end

local function close(kind)
  if valid_win(state[kind].win) then
    vim.api.nvim_win_close(state[kind].win, true)
  end
  state[kind].win = nil
end

local function open_split(cwd)
  vim.cmd("botright 14split")
  vim.cmd("enew")

  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_get_current_buf()

  vim.wo[win].winfixheight = true

  start_shell(buf, cwd, "split")

  state.split.win = win
  state.split.buf = buf
end

local function open_float(cwd)
  local buf = valid_buf(state.float.buf) and state.float.buf or vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.84)
  local height = math.floor(vim.o.lines * 0.72)
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    border = "rounded",
    col = col,
    height = height,
    relative = "editor",
    row = row,
    style = "minimal",
    title = " Terminal ",
    title_pos = "left",
    width = width,
  })

  vim.wo[win].winblend = 0

  if vim.bo[buf].buftype ~= "terminal" then
    start_shell(buf, cwd, "float")
  else
    vim.api.nvim_set_current_buf(buf)
    vim.cmd("startinsert")
  end

  state.float.win = win
  state.float.buf = buf
end

function M.toggle_bottom(scope)
  if valid_win(state.split.win) then
    close("split")
    return
  end

  open_split(resolve_cwd(scope))
end

function M.toggle_float(scope)
  if valid_win(state.float.win) then
    close("float")
    return
  end

  open_float(resolve_cwd(scope))
end

function M.open_ghostty(scope)
  if vim.fn.executable("ghostty") == 0 then
    notify("ghostty no está disponible en PATH", vim.log.levels.WARN)
    return
  end

  local cwd = resolve_cwd(scope)
  local job = vim.fn.jobstart({ "ghostty", "--working-directory=" .. cwd }, { detach = true })

  if job <= 0 then
    notify("No se pudo abrir ghostty", vim.log.levels.ERROR)
  end
end

function M.setup()
  if vim.g.oc2_terminal_setup then
    return
  end

  vim.g.oc2_terminal_setup = true

  vim.api.nvim_create_user_command("TermHere", function()
    M.toggle_bottom("buffer")
  end, { desc = "Toggle terminal in current file directory" })

  vim.api.nvim_create_user_command("TermRoot", function()
    M.toggle_bottom("root")
  end, { desc = "Toggle terminal in project root" })

  vim.api.nvim_create_user_command("TermFloatHere", function()
    M.toggle_float("buffer")
  end, { desc = "Toggle floating terminal in current file directory" })

  vim.api.nvim_create_user_command("TermFloatRoot", function()
    M.toggle_float("root")
  end, { desc = "Toggle floating terminal in project root" })

  vim.api.nvim_create_user_command("GhosttyHere", function()
    M.open_ghostty("buffer")
  end, { desc = "Open Ghostty in current file directory" })

  vim.api.nvim_create_user_command("GhosttyRoot", function()
    M.open_ghostty("root")
  end, { desc = "Open Ghostty in project root" })
end

return M
