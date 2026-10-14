Create the directory symlink once, with no existing `~/.hammerspoon` entry:

```sh
ln -s ~/.dotfiles/hammerspoon ~/.hammerspoon
```

The config is split into:

- `init.lua`: shared modifiers, the local CLI, and module loading.
- `mouse.lua`: pointer and monitor shortcuts.
- `teams.lua`: microphone, camera, leave-call, and raise/lower-hand shortcuts.

The whole configuration directory is symlinked into `~/.hammerspoon`, so
Hammerspoon finds all modules through its default search path. All configuration
files remain in the dotfiles checkout.

To add another group, create a sibling module with a `setup(super_key)` function
and load it from `init.lua` using `require("module_name").setup(super_key)`.
