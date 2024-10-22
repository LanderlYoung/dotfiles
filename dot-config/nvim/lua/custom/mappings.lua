local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { -- db -> debug
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = { -- dr -> debugger run
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  },
}


return M
