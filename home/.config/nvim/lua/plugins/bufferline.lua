return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
        require("bufferline").setup {
            options = {
                mode = "buffers",
                numbers = "none",
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator = {
                    icon = '▎',
                    style = 'icon',
                },
                buffer_close_icon = '󰅖',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                max_name_length = 18,
                max_prefix_length = 15,
                tab_size = 18,
                diagnostics = false,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true
                    }
                },
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                persist_buffer_sort = true,
                separator_style = "thin",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
            }
        }

        local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
        if normal_bg then
            vim.api.nvim_set_hl(0, "BufferLineFill", { bg = normal_bg })
            vim.api.nvim_set_hl(0, "TabLineFill", { bg = normal_bg })
        end

        vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "切换到上一个缓冲区" })
        vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "切换到下一个缓冲区" })
        vim.keymap.set("n", "<Leader>b>", "<Cmd>BufferLineMoveNext<CR>", { desc = "将缓冲区向右移动" })
        vim.keymap.set("n", "<Leader>b<", "<Cmd>BufferLineMovePrev<CR>", { desc = "将缓冲区向左移动" })

        for i = 1, 9 do
            vim.keymap.set("n", "<A-" .. i .. ">", "<Cmd>lua require('bufferline').go_to(" .. i .. ", true)<CR>", { desc = "跳转到缓冲区 " .. i })
        end

        vim.keymap.set("n", "<Leader>c", "<Cmd>bdelete<CR>", { desc = "关闭当前缓冲区" })
        vim.keymap.set("n", "<Leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "关闭其他缓冲区" })
        vim.keymap.set("n", "<Leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "关闭右侧缓冲区" })
        vim.keymap.set("n", "<Leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "关闭左侧缓冲区" })
    end
}
