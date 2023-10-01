require('neo-tree').setup({
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
    },
    window = {
    	position = "float",
        width = 45
    },
    filesystem = {
        follow_current_file = {
            enabled = true,
        },
        components = {
            harpoon_index = function(config, node, state)
                local Marked = require("harpoon.mark")
                local path = node:get_id()
                local succuss, index = pcall(Marked.get_index_of, path)
                if succuss and index and index > 0 then
                    return {
                        text = string.format("  %d", index), -- <-- Add your favorite harpoon like arrow here
                        highlight = config.highlight or "NeoTreeDirectoryIcon",
                    }
                else
                    return {}
                end
            end
        },
        renderers = {
            file = {
                { "icon" },
                { "name",         use_git_status_colors = true },
                { "harpoon_index" }, --> This is what actually adds the component in where you want it
                { "diagnostics" },
                { "git_status",   highlight = "NeoTreeDimText" },
            }
        }
    },
    document_symbols = {
        window = {
            mappings = {
                ["<cr>"] = "toggle_node",
            }
        }
    }
})

vim.keymap.set("n", "<leader>tf", "<cmd>Neotree toggle filesystem float<cr>")
vim.keymap.set("n", "<leader>tF", "<cmd>Neotree toggle filesystem left<cr>")
vim.keymap.set("n", "<leader>tb", "<cmd>Neotree toggle buffers float<cr>")
vim.keymap.set("n", "<leader>tg", "<cmd>Neotree toggle git_status left<cr>")
vim.keymap.set("n", "<leader>ts", "<cmd>Neotree toggle document_symbols float<cr>")
vim.keymap.set("n", "<leader>tS", "<cmd>Neotree toggle document_symbols left<cr>")
vim.keymap.set("n", "<leader>tc", "<cmd>Neotree close<cr>")
