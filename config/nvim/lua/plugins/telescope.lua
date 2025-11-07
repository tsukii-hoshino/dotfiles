return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "sharkdp/fd" },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          center = {
            height = 1,
            width = 1,
            preview_cutoff = 40,
            prompt_position = "top",
          },
        },
      },
    })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })

    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "none", bg = "none" })
  end,
}
