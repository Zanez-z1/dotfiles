return {
  {
    "saghen/blink.cmp",
    opts = {
      signature = {
        enabled = true,
        trigger = { show_on_insert = true, show_on_accept = true },
        window = { border = "rounded", show_documentation = true },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      delay = 300,
      spec = {
        { "<leader>c", group = "代码操作" },
        { "<leader>r", group = "重命名" },
        { "<leader>w", group = "窗口" },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        once = true,
        callback = function()
          pcall(vim.keymap.del, "n", "<leader>c")
          local map = vim.keymap.set
          map("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "关闭当前缓冲区" })
          map("n", "<leader>?", function() require("which-key").show({ global = true }) end, { desc = "查看全部快捷键" })
          map("n", "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "搜索全部快捷键" })
          map("n", "<leader>ch", vim.lsp.buf.signature_help, { desc = "查看函数参数" })
          map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "查看函数参数" })
          map("n", "K", vim.lsp.buf.hover, { desc = "查看符号文档" })
          map("n", "<leader>cm", function() vim.cmd("Man " .. vim.fn.expand("<cword>")) end, { desc = "查看光标处函数的 man 手册" })
          map("n", "<leader>ws", "<Cmd>split<CR>", { desc = "上下分屏" })
          map("n", "<leader>wv", "<Cmd>vsplit<CR>", { desc = "左右分屏" })
          map("n", "<leader>wc", "<Cmd>close<CR>", { desc = "关闭当前窗口" })
        end,
      })
    end,
  },
}
