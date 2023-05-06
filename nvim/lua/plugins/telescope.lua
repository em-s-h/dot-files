local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
    print("telescope is not installed!")
    return
end

local actions_status, actions = pcall(require, "telescope.actions")
if not actions_status then
    print("telescope.actions not found!")
    return
end

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,  -- Send selected to quickfixlist.
                ["<C-k>"] = actions.move_selection_previous,                        -- Move to prev result.
                ["<C-j>"] = actions.move_selection_next,                            -- Move to next result.
            },
        },
    }
})

telescope.load_extension("fzf")
