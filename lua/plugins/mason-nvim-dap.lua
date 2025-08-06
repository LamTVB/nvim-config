return {
  "jay-babu/mason-nvim-dap.nvim",
  ---@type MasonNvimDapSettings
  opts = {
    -- This line is essential to making automatic installation work
    handlers = {

    },
    automatic_installation = {
      -- These will be configured by separate plugins.
      exclude = {
        "delve",
        "python",
      },
    },
    -- DAP servers: Mason will be invoked to install these if necessary.
    ensure_installed = {
      "node2"
    },
  },
  dependencies = {
    "mfussenegger/nvim-dap",
    "williamboman/mason.nvim",
  },
}
