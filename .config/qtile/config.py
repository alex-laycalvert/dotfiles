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
from libqtile import extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# easier to type for me
mod = "mod4"
alt = "mod1"
shift = "shift"
space = "space"
ctrl = "control"
enter = "Return"
tab = "Tab"

# default applications
terminal = "kitty"
browser = "brave"

# colorscheming
bar_bg_color = '202030'
<<<<<<< HEAD
light_gray = '353560'
dark_gray = '303040'
# text = '1d73dd'
text = 'b260ef'
=======
light_gray = '404055'
dark_gray = '303045'
text = 'CA80F5'
>>>>>>> ee7aa0a (Setting up PC)
red = 'ff0000'
white = 'ffffff'
black = '000000'
bitcoin_orange = 'f2a900'
burnt_orange = 'cc5500'
orange = 'ff4500'

# icons for web links and other stuff
arch_icon = ' '
mail_icon = ''
youtube_icon = ''
bitcoin_icon = ''
github_icon = ''
rust_icon = ''
reddit_icon = ''
# reddit_icon = ''

widget_lsep = ''
widget_rsep = ''
widget_sep_size = 24 

# Reading gmail user info so I don't post it on GitHub again
gmail_user_file = open("/home/alex/.cred/gmail/username")
gmail_pass_file = open("/home/alex/.cred/gmail/password")
gmail_username = gmail_user_file.read().strip()
gmail_password = gmail_pass_file.read().strip()
gmail_user_file.close()
gmail_pass_file.close()

# dmenu_run setup
def dmenu_run_extension():
    return extension.DmenuRun(
        dmenu_font = 'SourceCodePro',
        background = bar_bg_color,
        foreground = text,
        selected_background = dark_gray,
        selected_foreground = text,
        dmenu_height = 28,
        )

# in progress
def dmenu_change_theme():
    return extension.Dmenu(
            dmenu_prompt = ">"
            )

groups = [Group(i) for i in "1234567890"]

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc = "Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc = "Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc = "Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc = "Move focus up"),
    Key([mod], space, lazy.layout.next(), desc = "Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, shift], "h", lazy.layout.shuffle_left(), desc = "Move window to the left"),
    Key([mod, shift], "l", lazy.layout.shuffle_right(), desc = "Move window to the right"),
    Key([mod, shift], "j", lazy.layout.shuffle_down(), desc = "Move window down"),
    Key([mod, shift], "k", lazy.layout.shuffle_up(), desc = "Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, ctrl], "h", lazy.layout.grow_left(), desc = "Grow window to the left"),
    Key([mod, ctrl], "l", lazy.layout.grow_right(), desc ="Grow window to the right"),
    Key([mod, ctrl], "j", lazy.layout.grow_down(), desc ="Grow window down"),
    Key([mod, ctrl], "k", lazy.layout.grow_up(), desc = "Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc ="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, shift], enter, lazy.layout.toggle_split(), desc = "Toggle between split and unsplit sides of stack"),
    Key([mod], enter, lazy.spawn(terminal), desc = "Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc = "Spawn Browser"),

    # Toggle between different layouts as defined below
    Key([mod], "p", lazy.next_layout(), desc = "Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc = "Kill focused window"),

    Key([mod, ctrl], "r", lazy.restart(), desc = "Restart Qtile"),
    Key([mod, ctrl], "q", lazy.shutdown(), desc = "Shutdown Qtile"),
    Key([mod], "r", lazy.run_extension(dmenu_run_extension()), desc = "Spawn DistroTube's dmenu_run"),

    # emulating the macOS keybinding
    Key([alt], space, lazy.run_extension(dmenu_run_extension()),
        desc = "Spawn DistroTube's dmenu_run"),
    # Key([mod, ctrl], 't', lazy.run_extension(dmenu_change_theme()), desc = "Change my custome theme in ~/git/mythemes"),

    # cycling groups
]

for i, g in enumerate(groups):
    # next_group_i = (i + 1) % len(groups)
    # next_group = groups[(i + 1) % len(groups)].name
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], g.name, lazy.group[g.name].toscreen(),
            desc="Switch to group {}".format(g.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, shift], g.name, lazy.window.togroup(g.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(g.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
        
        # moving between groups
        # Key([mod], tab, lazy.spawn(terminal + ' ' + str(next_group_i))),
    ])

layouts = [
    layout.Columns(
        border_focus_stack=['#d75f5f', '#8f3d3d'], 
        border_width=3,
        margin=10,
    ),
    layout.Max(),
]

widget_defaults = dict(
    # Uses SauceCodePro (SourceCodePro) from Nerd Fonts
    font = 'SauceCodePro Nerd Font',
    fontsize = 18,
    padding = 10,

    # same as my kitty terminal background
    background = bar_bg_color,
)
extension_defaults = widget_defaults.copy()



def init_widgets_list():
    widgets_list = [
            widget.TextBox(
<<<<<<< HEAD
                # background = dark_gray,
=======
>>>>>>> ee7aa0a (Setting up PC)
                foreground = text,
                text = arch_icon,
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://archlinux.org/') },
                ),

<<<<<<< HEAD
            # widget.TextBox(
            #     foreground = dark_gray,
            #     text = widget_lsep,
            #     padding = 0,
            #     ),

=======
>>>>>>> ee7aa0a (Setting up PC)
            widget.GroupBox(
                # background = dark_gray,
                hide_unused = True,
                foreground = text,
                ),
            
            widget.WindowName(
                foreground = text,
                ),

            widget.TextBox(
                foreground = dark_gray,
                text = widget_rsep,
                padding = 0,
                fontsize = widget_sep_size,
                ),

            widget.TextBox(
                foreground = white,
                background = dark_gray,
                text = github_icon,
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://github.com') },
                ),

            widget.TextBox(
                fontsize = 26,
                foreground = burnt_orange,
                background = dark_gray,
                text = rust_icon,
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://doc.rust-lang.org/book/') },
                ),
            
            widget.Sep(
                background = dark_gray,
                foreground = text,
                ),

            widget.TextBox(
                background = dark_gray,
                foreground = orange,
                text = reddit_icon,
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://reddit.com') },
                ),

            widget.TextBox(
                background = dark_gray,
                foreground = red,
                text = youtube_icon,
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://www.youtube.com') },
                ),

            widget.TextBox(
                background = dark_gray,
                foreground = white,
                text = mail_icon,
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://www.gmail.com') },
                ),

            widget.GmailChecker(
                background = dark_gray,
                foreground = white,
                username = gmail_username,
                password = gmail_password,
                email_path = 'INBOX',
                status_only_unseen = True,
                display_fmt = '[{1}]',
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://www.gmail.com') },
                padding = 0,
                ),

            # Sometimes I like seeing the price, sometimes I don't
            # maybe I'll make it dynamic
            # widget.CryptoTicker(
            #     background = light_gray,
            #     foreground = text,
            #     format = ' {amount}',
            #     update_interval=60,
            #     mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://www.coinbase.com/price/bitcoin') },
            #     ),

            widget.TextBox(
                background = dark_gray,
                foreground = bitcoin_orange,
                text = bitcoin_icon,
                mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(browser + ' https://www.coinbase.com/price/bitcoin') },
                ),

            widget.Sep(
                background = dark_gray,
                foreground = text,
                ),

            widget.Systray(
                background = dark_gray,
                foreground = text,
                padding = 4,
                ),

            widget.TextBox(
                background = dark_gray,
                foreground = bar_bg_color,
                text = widget_rsep,
                padding = 0,
                fontsize = widget_sep_size,
                ),

            widget.Clock(
                # background = light_gray,
                foreground = text,
                format = '%a %H:%M',
                ),

            widget.TextBox(
                background = light_gray,
                foreground = dark_gray,
                text = widget_rsep,
                padding = 0,
                fontsize = widget_sep_size,
                ),

            widget.Battery(
                discharge_char = '',
                charge_char = '',
                full_char = '',
                empty_char = '',
                unknown_char = '',
                background = dark_gray,
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
                opacity = 0.9
                )
            ),
        Screen(),
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

@hook.subscribe.shutdown
def shutdown_script():
    home = os.path.expanduser('~')
    subprocess.call(['sh', home + '/.config/qtile/autoshut.sh'])

@hook.subscribe.restart
def restart_script():
    home = os.path.expanduser('~')
    subprocess.call(['sh', home + '/.config/qtile/autoshut.sh'])
    
# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
