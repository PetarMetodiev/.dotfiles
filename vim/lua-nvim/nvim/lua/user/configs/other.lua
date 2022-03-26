local status_ok, other = pcall(require, 'other-nvim')
if not status_ok then
    print('Could not load other-nvim')
    return
end

other.setup({
    mappings = {
        {
            pattern = '/(.*).scss$',
            target = '/%1.tsx',
        },
        {
            pattern = '/(.*).css$',
            target = '/%1.tsx',
        },
        {
            pattern = '/(.*).tsx$',
            target = '/%1.scss',
        },
        {
            pattern = '/(.*).tsx$',
            target = '/%1.css',
            context = 'css',
        },
    },
})

nnoremap('<leader><C-v>', '<cmd>OtherVSplit<CR>')
nnoremap('<leader><C-s>', '<cmd>OtherSplit<CR>')
