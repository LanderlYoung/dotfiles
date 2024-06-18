local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { -- db -> debug
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint at line",
    },
    ["<leader>dr"] = { -- dr -> debugger run
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    ["<leader>dso"] = {
      "<cmd> DapStepOver <CR>",
      "Debugger stop over",
    },
    ["<leader>dsO"] = {
      "<cmd> DapStepOut <CR>",
      "Debugger stop Out",
    },
    ["<leader>dsi"] = {
      "<cmd> DapStepInto <CR>",
      "Debugger stop into",
    },
    ["<leader>dx"] = {
      "<cmd> DapTerminate <CR>",
      "Terminate/Exit the debugger",
    },
  },
}

M.telescope = {
  plugin = true, -- for what?
  n = {
    ["<leader>o"] = {
      "<cmd> Telescope lsp_document_symbols <CR>",
      "Show file symbols",
    },
    ["<leader>O"] = {
      "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>",
      "Show workspace symbols",
    }
  },
}

return M
