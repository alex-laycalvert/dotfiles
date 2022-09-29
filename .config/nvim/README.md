# .config/nvim

My custom setup for `neovim` with a decent amount of plugins.

## Plugins

My plugin setup always changes whenever I find alternatives or
builtin functionality so just look at `lua/plugins/init.lua` in
my `packer.nvim` startup function for my running list.

I also have a few custom plugins from time to time that are
mostly just very slight hacks on exiting ones or fun projects
you can find at my [github](https://github.com/alex-laycalvert).

## Colorscheme

It's basically `dracula`.

## Keymappings

My keymappings that are used across all of `neovim` are put into
`lua/options/keybindings.lua`. The various mapping functions are
from `lua/utils/init.lua` and just assist in mappings.

All other plugin specific ones are in the file dedicated to the
plugin. Some of these keybindings may seem weird or non-intuitive
but I've used them for so long they are natural to me.

## Incoming criticism

Oh boy here we go.

### Wow that's a lot of files

Yeah it is but the idea is ***abstraction***.

Each different plugin gets its own file in my `lua/plugins` directory
and every collection of similar options gets their own file in my
`lua/options` directory. Each one may only be a couple lines long but
now I don't have to worry about loads of other settings cluttering a
file when I want to change a specific plugin.

### That's way too many plugins

No it's not, plugins are cool, get off my text-editor.

