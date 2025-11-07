return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function load_ascii_art(filepath)
        local file = io.open(filepath, "r")

        local lines = {}
        for line in file:lines() do
          table.insert(lines, line)
        end
        file:close()

        table.insert(lines, 1, "")
        table.insert(lines, "")

        return lines
      end

      require("dashboard").setup({
        config = {
          header = load_ascii_art(vim.fn.stdpath("config") .. "/ascii.txt"),
          project = {
            label = "recent projects:"
          },
          mru = {
            label = "recent files:"
          },
          shortcut = {
            { icon = "󰒲 ", desc = "lazy", group = "shortcut_1", action = "Lazy", key = "l" },
            { icon = "󰍉 ", desc = "files", group = "shortcut_2", action = "Telescope find_files", key = "f" },
            { icon = "󰠜 ", desc = "quit", group = "shortcut_3", action = "qa", key = "q" },
          },
          footer = {
            "",
            "   don't forget to stay hydrated! :3",
          },
        },
      })

      vim.api.nvim_set_hl(0, "DashboardHeader", { link = "Green" })
      vim.api.nvim_set_hl(0, "DashboardFooter", { link = "Green" })
      vim.api.nvim_set_hl(0, "shortcut_1", { fg = "#7fbbb3" })
      vim.api.nvim_set_hl(0, "shortcut_2", { fg = "#83C092" })
      vim.api.nvim_set_hl(0, "shortcut_3", { fg = "#E67E80" })
    end,
  },
}
