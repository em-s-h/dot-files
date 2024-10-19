local function save_playlist_position(event)
    if event.reason ~= "eof" and event.reason ~= "quit" then
        return
    end
    local file_path = mp.get_opt("last_entry_id_file")
    if not file_path then
        return
    end
    print("Saving playlist position...")
    local file = io.open(file_path, "w")
    local id = event.playlist_entry_id - 2

    file:write(id)
    file:close()
end

mp.register_event("end-file", save_playlist_position)
