local status_ok, fidget = pcall(require, 'fidget')
if not status_ok then
    print('Could not load fidget')
    return
end

fidget.setup()

