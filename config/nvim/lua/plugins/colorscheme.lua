return {

  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_transparent_background = 2
    vim.g.everforest_dim_inactive_windows = 1
    vim.g.everforest_better_performance = 1
    vim.cmd.colorscheme('everforest')

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "LazyNormal", { bg = "none" })
    --vim.opt.winblend = 20
  end,

}
