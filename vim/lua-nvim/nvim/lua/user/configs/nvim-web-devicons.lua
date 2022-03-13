require('user/utils')

local status_ok, nvim_web_devicons = pcall(require, 'nvim-web-devicons')
if not status_ok then
    print('Could not load nvim-web-devicons')
    return
end


nvim_web_devicons.setup({
    default = true,
})
