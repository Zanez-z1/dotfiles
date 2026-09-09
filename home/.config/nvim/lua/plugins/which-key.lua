return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        spec = {
            { "<leader>f", group = "查找" },
            { "<leader>b", group = "缓冲区" },
            { "<leader>t", group = "切换" },
            { "<leader>g", group = "代码导航" },
        },
    },
}
