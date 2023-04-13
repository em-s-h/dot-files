local status, lualine = pcall(require, "lualine") 

if not status then
    print("lualine is not installed!")
    return
end

lualine.setup({
    options = {
        theme = "auto",
    },
})
