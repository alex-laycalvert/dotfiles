# -*- coding: utf-8 -*-
#
# alex-laycalvert
# 
# qtile/config.py firewatch theme
#
# https://github.com/alex-laycalvert/dotfiles

import os
import subprocess
from typing import List  # noqa: F401
from libqtile import qtile
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
alt = "mod1"
shift = "shift"
space = "space"
ctrl = "control"
enter = "Return"
tab = "Tab"

terminal = "kitty"
browser = "brave"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], space, lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, shift], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, shift], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, shift], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, shift], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, ctrl], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, ctrl], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, ctrl], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, ctrl], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, shift], enter, lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    Key([mod], enter, lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Spawn Browser"),

    # Toggle between different layouts as defined below
    Key([mod], tab, lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, ctrl], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, ctrl], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([alt], space, lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.Columns(
        border_focus_stack=['#d75f5f', '#8f3d3d'], 
        border_width=3,
        margin=10,
    ),
    layout.Max(),
    #layout.Stack(num_stacks=2),
    # layout.Bsp(),
    #layout.Matrix(
    #    margin = 10
    #),
    #layout.MonadTall(
    #    margin = 8 
    #),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    # Uses SauceCodePro (SourceCodePro) from Nerd Fonts
    font='SauceCodePro Nerd Font',
    fontsize=18,
    padding=10,

    # same as my kitty terminal background
    background='#202030',
)
extension_defaults = widget_defaults.copy()

lightGray = '404055'
darkGray = '303045'
text = 'e49070'

widgetLSep = ''
widgetRSep = ''
widgetSepSize = 24 

# Reading gmail user info so I don't post it on GitHub again
gmailUsernameFile = open("/home/alex/.cred/gmail/username")
gmailPasswordFile = open("/home/alex/.cred/gmail/password")
gmailUsername = gmailUsernameFile.read().strip()
gmailPassword = gmailPasswordFile.read().strip()
gmailUsernameFile.close()
gmailPasswordFile.close()

def init_widgets_list():
    widgets_list = [
            widget.TextBox(
                background = darkGray,
                foreground = text,
                text = ' ',
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://archlinux.org/') },
                ),

            widget.GroupBox(
                background = lightGray,
                hide_unused = True,
                foreground = text,
                ),

            widget.Prompt(
                foreground = text,
                background = darkGray,
                prompt = "> ",
                ),
            
            widget.WindowName(
                foreground = text,
                ),

            widget.TextBox(
                foreground = lightGray,
                text = widgetRSep,
                padding = 0,
                fontsize = widgetSepSize,
                ),

            widget.Systray(
                background = lightGray,
                foreground = text,
                padding = 4,
                ),

            widget.TextBox(
                background = lightGray,
                foreground = darkGray,
                text = widgetRSep,
                padding = 0,
                fontsize = widgetSepSize,
                ),

            widget.TextBox(
                background = darkGray,
                foreground = text,
                text = '',
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://www.gmail.com') },
                ),

            widget.GmailChecker(
                background = darkGray,
                foreground = text,
                username = gmailUsername,
                password = gmailPassword,
                email_path = 'INBOX',
                status_only_unseen = True,
                display_fmt = '[{1}]',
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://www.gmail.com') },
                padding = 0,
                ),

            widget.TextBox(
                background = darkGray,
                foreground = text,
                text = '',
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://www.youtube.com') },
                ),

            # Sometimes I like seeing the price, sometimes I don't
            # maybe I'll make it dynamic
            # widget.CryptoTicker(
            #     background = lightGray,
            #     foreground = text,
            #     format = ' {amount}',
            #     update_interval=60,
            #     mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://www.coinbase.com/price/bitcoin') },
            #     ),

            widget.TextBox(
                background = darkGray,
                foreground = text,
                text = '',
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://www.coinbase.com/price/bitcoin') },
                ),

            

            widget.TextBox(
                background = darkGray,
                foreground = lightGray,
                text = widgetRSep,
                padding = 0,
                fontsize = widgetSepSize,
                ),

            widget.Clock(
                background = lightGray,
                foreground = text,
                format = '%a %H:%M',
                ),

            widget.TextBox(
                background = lightGray,
                foreground = darkGray,
                text = widgetRSep,
                padding = 0,
                fontsize = widgetSepSize,
                ),

            widget.Battery(
                discharge_char = '',
                charge_char = '',
                full_char = '',
                empty_char = '',
                unknown_char = '',
                background = darkGray,
                foreground = text,
                format="{char} {percent:2.0%}",
                update_interval = 30,
                ),

        ]
    return widgets_list

def init_widgets_screen():
    widgets_screen = init_widgets_list()
    #del widgets_screen[x:x]
    return widgets_screen

def init_screens():
    return [
        Screen(top = bar.Bar(
                widgets = init_widgets_screen(), 
                size = 27,
                opacity = 0.8
                )
            )
        ]

if __name__ in { "config", "__main__" }:
    screens = init_screens()
    widget_list = init_widgets_list()

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call(['sh', home + '/.config/qtile/autostart.sh'])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
