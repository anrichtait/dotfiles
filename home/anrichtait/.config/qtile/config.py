from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from keys import keys
import os
import subprocess
from libqtile import hook
from qtile_extras import widget as extra_widget
from qtile_extras import bar as extra_bar
from qtile_extras.widget.groupbox2 import GroupBox2, GroupBoxRule, ScreenRule
from qtile_extras.layout.decorations import CustomBorder


@hook.subscribe.startup
def autostart():
    subprocess.call([os.path.expanduser('~/.config/qtile/autostart.sh')])


bg_color = "#0b0822"
mod = "mod4"
terminal = guess_terminal()

# groups = [Group(i) for i in "123456789"]
groups = [
    Group("1", label="一"),
    Group("2", label="二"),
    Group("3", label="三"),
    Group("4", label="四"),
    Group("5", label="五"),
    Group("6", label="六"),
    Group("7", label="七"),
    Group("8", label="八"),
    Group("9", label="九"),
]

for i in groups:
    keys.extend(
            [
                # mod + group number = switch to group
                Key(
                    [mod],
                    i.name,
                    lazy.group[i.name].toscreen(),
                    desc="Switch to group {}".format(i.name),
                    ),
                Key(
                    [mod, "shift"],
                    i.name,
                    lazy.window.togroup(i.name, switch_group=True),
                    desc="Move focused window to group {}".format(i.name),
                    ),
                ]
            )


layouts = [
        layout.MonadTall(
            new_window_position='right',
            ratio=0.65,
            max_ratio=0.65,
            min_ratio=0.25,
            border_focus='#f7f9fc',
            border_normal=bg_color,
            border_width=1,
            margin=4,
            ),
        ]


def set_label(rule, box):
    if box.focused:
        rule.text = ""
    elif box.occupied:
        rule.text = ""
    else:
        rule.text = "○"
    return True


widget_defaults = dict(
        font="TerminessNerdFont",
        fontsize=12,
        padding=3,
        )
extension_defaults = widget_defaults.copy()


screens = [
        Screen(
            bottom=bar.Bar(
                [
                    extra_widget.GroupBox(
                        hide_unused=True,
                        highlight_method='line',
                        highlight_color=[bg_color, bg_color],
                        ),
                    widget.Spacer(),
                    widget.Mpd2(
                        status_format='{play_status} {artist} - {title}'
                        ),
                    widget.Spacer(),
                    widget.TextBox(
                            text='󰃠 ',
                            fontsize=12,
                            ),
                    widget.Backlight(
                            name='backlight',
                            backlight_name='intel_backlight',
                            change_command=None,
                        ),
                    widget.TextBox(
                        text='|',
                        fontsize=12,
                        ),
                    widget.TextBox(
                            text='',
                            fontsize=12,
                            ),
                    widget.Volume(),
                    widget.TextBox(
                        text='|',
                        fontsize=12,
                        ),
                    extra_widget.UPowerWidget(
                            battery_width=15,
                            battery_height=8,
                            border_charge_colour='#ffffff',
                            border_colour='#ffffff',
                            border_critical_colour='#fc6860',
                            spacing=10,
                            ),
                    widget.TextBox(
                        text='|',
                        fontsize=12,
                        ),
                    extra_widget.WiFiIcon(
                            wifi_rectangle_width=5,
                            wifi_shape='rectangle',
                            ),
                    widget.TextBox(
                        text=' ',
                        fontsize=12,
                        ),
                    widget.TextBox(
                        text='日',
                        fontsize=12,
                        padding=1,
                        ),
                    widget.Clock(
                        format="%d",
                        padding=1,
                        ),
                    widget.TextBox(
                        text='月',
                        fontsize=12,
                        padding=1,
                        ),
                    widget.Clock(
                        format="%m",
                        padding=1,
                        ),
                    widget.TextBox(
                        text='年',
                        padding=1,
                        fontsize=12,
                        ),
                    widget.Clock(
                        format="%y",
                        padding=1,
                        ),
                    widget.TextBox(
                        text='時',
                        fontsize=12,
                        padding=1,
                        ),
                    widget.Clock(
                        format="%I:%M",
                        padding=1,
                        ),
                    widget.TextBox(
                        text=' ',
                        fontsize=12,
                        ),
                    ],
                24,  # Height of the bar
                border_width=[1, 1, 1, 1],
                border_color=["#afaca7", bg_color, "#afaca7", bg_color],
                margin=[10, 100, 10, 100],
                background=bg_color
                ),
            ),
        ]

mouse = [
        Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
        Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.bring_to_front()),
        ]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
        float_rules=[
            *layout.Floating.default_float_rules,
            Match(wm_class="confirmreset"),  # gitk
            Match(wm_class="makebranch"),  # gitk
            Match(wm_class="maketag"),  # gitk
            Match(wm_class="ssh-askpass"),  # ssh-askpass
            Match(title="branchdialog"),  # gitk
            Match(wm_class="arandr"),
            Match(wm_class="Godot_Engine"),
            Match(wm_type="popup_menu"),
            Match(wm_type="dialog"),
            Match(wm_class="Unity", wm_type="menu"),
            Match(wm_class="Unity", title="Package Manager"),
            Match(wm_class="Godot_ProjectList"),
            Match(wm_class="Godot", wm_type="normal"),
            Match(wm_class="Godot", wm_type="dialog"),
            Match(wm_class="Godot", wm_type="utility"),
            Match(wm_class="Godot", wm_type="menu"),
            Match(wm_class="Godot", wm_type="dropdown_menu"),
            Match(wm_class="Godot", wm_type="popup_menu"),
            Match(wm_class="Game Window"),
            Match(wm_class="bevy.app"),
            Match(wm_class="bevy_game"),

            ]
        )
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_xcursor_theme = None
wl_xcursor_size = 24
wmname = "LG3D"
