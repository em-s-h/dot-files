local status, comment = pcall(require, "Comment")

if not status then
    print("comment is not installed")
    return
end

comment.setup()
