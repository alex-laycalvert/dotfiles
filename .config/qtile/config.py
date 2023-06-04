# .config/qtile/config.py
# alex-laycalvert

import os
import subprocess
from typing import List  # noqa: F401
from libqtile import qtile
from libqtile import bar, layout, widget, hook
from libqtile import extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"

myTerm = "kitty"
myBrowser = "brave"

### COLORS
bar_bg = "202030"
widget_group_color = '303045'
arch_color = '1793d1'

### ICONS
arch_icon = ''
browser_icon = '󰖟'
terminal_icon = ''
mail_icon = ''
github_icon = ''
reddit_icon = ''
calendar_icon = ''
clock_icon = ''
cpu_icon = ''
memory_icon = ''
disk_icon = ''
net_icon = '󰈀'
down_arrow_icon = '↓'
up_arrow_icon = '↑'
power_icon = ''
widget_lsep = ''
widget_rsep = ''

widget_sep_size = 30
top_window_margin = 3
window_margin = 3
bar_size = 35

term_colors = [
            '000000', 'ff5555', '50fa7b', 'f0fa8b', '2c79d9', 'ff78c5', '8ae9fc', 'bbbbbb', 
            '999999', 'ff5454', '50fa7b', 'f0fa8b', '2c79d9', 'ff78c5', '8ae9fc', 'ffffff'
            ]

home = os.path.expanduser('~')

# dmenu_run setup
def drun_ext():
    return extension.DmenuRun(
        dmenu_font = 'Hasklug Nerd Font',
        background = bar_bg,
        foreground = arch_color,
        selected_background = widget_group_color,
        selected_foreground = arch_color,
        dmenu_height = bar_size * 1.5,
        dmenu_ignorecase = True,
        dmenu_prompt = " run > ",
        )

keys = [
        # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc = "Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc = "Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc = "Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc = "Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc = "Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc = "Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc = "Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc = "Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc = "Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc = "Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc ="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc ="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc = "Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc ="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc = "Toggle between split and unsplit sides of stack"),

    Key([mod], "Return", lazy.spawn(myTerm), desc = "Launch terminal"),
    Key([mod], "b", lazy.spawn(myBrowser), desc = "Spawn Browser"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc = "Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc = "Toggle between layouts"),

    Key([mod], "w", lazy.window.kill(), desc = "Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc = "Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc = "Shutdown Qtile"),
    Key([mod], "r", lazy.run_extension(drun_ext()), desc = "Spawn DistroTube's dmenu_run"),
    # emulating the macOS keybinding
    Key(["mod1"], "space", lazy.run_extension(drun_ext()),
        desc = "Spawn DistroTube's dmenu_run"),
    Key([mod], "e", lazy.spawn(home + "/.config/scripts/edit-dotfiles.sh"), desc = "Edit dotfiles"),
    Key([mod], "g", lazy.spawn(home + "/.config/scripts/git-projects.sh"), desc = "Edit git projects"),
    Key([mod, "shift", "control"], "l", lazy.spawn("xsecurelock")),
    Key([mod], "s", lazy.spawn("flameshot gui")),
]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),

            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),

            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(
        border_focus = arch_color,
        border_width = 1, 
        margin = [top_window_margin, window_margin, window_margin, window_margin],
        ),

    layout.TreeTab(
        font = "Hasklug Nerd Font",
        bg_color = bar_bg,
        active_bg = arch_color,
        section_fg = arch_color,
        section_top = 10,
        section_left = 10,
        sections = ['main'],
        ),

    layout.Max(
        ),

    layout.Floating(
        border_focus = "#d75f5f", 
        border_normal = "#8f3d3d",
        ),
]

widget_defaults = dict(
    font = "Hasklug Nerd Font",
    fontsize = 18,
    padding = 10,
    background = bar_bg,
)

extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [

                # Arch Icon Link
                widget.TextBox(
                    foreground = arch_color,
                    text = " " + arch_icon,
                    mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(myBrowser + ' https://archlinux.org/') },
                    fontsize = 20,
                    ),

                # Terminal
                widget.TextBox(
                    foreground = arch_color,
                    text = " " + terminal_icon + " ",
                    mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(myTerm) },
                    fontsize = 30,
                    ),

                # Browser Link
                widget.TextBox(
                    foreground = arch_color,
                    text = browser_icon,
                    mouse_callbacks = { 'Button1': lambda: qtile.cmd_spawn(myBrowser) },
                    fontsize = 30,
                    ),

                widget.CurrentLayoutIcon(
                    ),

                widget.GroupBox(
                    hide_unused = True,
                    ),

                widget.WindowName(
                    foreground = arch_color,
                    ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_rsep,
                    padding = 0,
                    fontsize = widget_sep_size,
                    ),

                widget.WidgetBox(
                    widgets = [
                        widget.CPU(
                            foreground = term_colors[3],
                            background = widget_group_color,
                            format = cpu_icon + ' {load_percent}%',
                            ),

                        widget.Memory(
                            foreground = term_colors[2],
                            background = widget_group_color,
                            measure_mem = 'G',
                            format = memory_icon + ' {MemPercent:.0f}%',
                            ),

                        widget.DF(
                            foreground = term_colors[5],
                            background = widget_group_color,
                            visible_on_warn = False,
                            format = disk_icon + ' {r:.0f}%',
                            ),

                        widget.Net(
                            foreground = term_colors[6],
                            background = widget_group_color,
                            format = net_icon + ' {down} ' + down_arrow_icon,
                            ),
                        ],
                    background = widget_group_color,
                    foreground = arch_color,
                    text_closed = '<',
                    text_open = '>',
                ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_lsep + " ",
                    padding = 0,
                    fontsize = widget_sep_size,
                    ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_rsep,
                    padding = 0,
                    fontsize = widget_sep_size,
                    ),

                widget.CheckUpdates(
                    background = widget_group_color,
                    custom_command = "pacman -Syu",
                    ),

                widget.Systray(
                    background = widget_group_color,
                    ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_lsep + " ",
                    padding = 0,
                    fontsize = widget_sep_size,
                    ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_rsep,
                    padding = 0,
                    fontsize = widget_sep_size,
                    ),

                widget.Clock(
                    format = calendar_icon + "  %a %m/%d | " + clock_icon + " %H:%M",
                    background = widget_group_color,
                    foreground = arch_color,
                    padding = 10,
                    ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_lsep + " ",
                    padding = 0,
                    fontsize = widget_sep_size,
                    ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_rsep,
                    padding = 0,
                    fontsize = widget_sep_size,
                    ),

                widget.Battery(
                    background = widget_group_color,
                    foreground = term_colors[2],
                    format = "{char} {percent:2.0%} {hour:d}:{min:02d}",
                    charge_char = "󰂄",
                    discharge_char = "󰁾",
                    empty_char = "󰂎",
                    full_char = "󰁹",
                    low_foreground = term_colors[1],
                    low_percentage = 0.1,
                    notify_below = 0.1,
                    unknown_char = "󱃍",
                    ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_lsep,
                    padding = 0,
                    fontsize = widget_sep_size,
                    ),

            ]
    return widgets_list

def init_widgets_screen():
    widgets_screen = init_widgets_list()
    #del widgets_screen[x:x]
    return widgets_screen

def init_widgets_screen_secondary():
    widgets_screen = init_widgets_list()
    del widgets_screen[7:11]
    return widgets_screen

def init_screens():
    return [
        Screen(top = bar.Bar(
                widgets = init_widgets_screen(),
                size = bar_size,
                #opacity = 0.7,
                margin = window_margin,
                border_width = [5, 5, 5, 0],
                border_color = bar_bg,
                ),
            ),
        Screen(top = bar.Bar(
                widgets = init_widgets_screen_secondary(),
                size = bar_size,
                opacity = 0.7,
                margin = window_margin,
                border_width = [5, 5, 5, 0],
                border_color = bar_bg,
                ),
            ),
        Screen(),
        Screen(),
        ]

if __name__ in { "config", "__main__" }:
    screens = init_screens()
    widget_list = init_widgets_list()

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),     # gitk
        Match(wm_class="makebranch"),       # gitk
        Match(wm_class="maketag"),          # gitk
        Match(wm_class="ssh-askpass"),      # ssh-askpass
        Match(title="branchdialog"),        # gitk
        Match(title="pinentry"),            # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# Scripts
@hook.subscribe.startup_once
def start_once():
    subprocess.call(['sh', home + '/.config/qtile/autostart.sh'])

@hook.subscribe.shutdown
def shutdown_script():
    subprocess.call(['sh', home + '/.config/qtile/autoshut.sh'])

@hook.subscribe.restart
def restart_script():
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
