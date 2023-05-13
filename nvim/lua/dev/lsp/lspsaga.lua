local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    print("lspsaga is not installed!")
    return
end

saga.setup({
    -- Keybinds for navigation in lspsaga window.
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },

    -- Use enter to open file with definition preview.
    definition = {
        edit = "<CR>",
    },

   ui = {
        colors = {
            normal_bg = "#022746",
        },
    },
})
