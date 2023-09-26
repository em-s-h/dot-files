local status, oil = pcall(require, "oil")
if not status then
    print("oil.nvim is not installed!")
    return
end

-- Open oil file explorer on parent directory
vim.keymap.set("n", "<leader><bs>", require("oil").open)

oil.setup({
    columns = {
        "icon",
        "permissions",
        "size",
    },

    win_options = {
        signcolumn = "yes",
    },

    delete_to_trash = true,
})
