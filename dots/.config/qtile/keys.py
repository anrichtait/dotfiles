from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
        # A list of available commands that can be bound to keys can be found
        # at https://docs.qtile.org/en/latest/manual/config/lazy.html
        # Switch between windows
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
        # Move windows between left/right columns or move up/down in current stack.
        # Moving out of range in Columns layout will create new column.
        Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        # Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
        # Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
        # Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
        # Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
        Key(
            [mod, "shift"],
            "Return",
            lazy.layout.toggle_split(),
            desc="Toggle between split and unsplit sides of stack",
            ),
        Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
        # Toggle between different layouts as defined below
        Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
        Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
        Key(
            [mod],
            "f",
            lazy.window.toggle_fullscreen(),
            desc="Toggle fullscreen on the focused window",
            ),
        Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
        Key([mod, "control"], "r", lazy.reload_config(), lazy.spawn("dunstify 'Config Reloaded'"),desc="Reload the config"),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
        Key([mod], "d", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
        Key(
            [],
            "XF86MonBrightnessUp",
            lazy.spawn("brightnessctl set +10%"),
            ),
        Key(
            [],
            "XF86MonBrightnessDown",
            lazy.spawn("brightnessctl set 10%-"),
            ),
        Key(
            [],
            "XF86AudioRaiseVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),  # Increase volume
            ),
        Key(
            [],
            "XF86AudioLowerVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),  # Decrease volume
            ),
        Key(
            [],
            "XF86AudioMute",
            lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),  # Toggle mute
            ),
        Key([mod], "d", lazy.spawn("/home/anrichtait/.config/rofi/launchers/type-6/launcher.sh"), desc="Launch custom Rofi script"),
        Key([mod, "shift"], "l", lazy.spawn("/home/anrichtait/.config/rofi/powermenu/type-4/powermenu.sh"), desc="Launch custom Rofi script"),
        Key([mod], "Print", lazy.spawn("flameshot full -p /home/anrichtait/Pictures/screenshots/")),
        Key([mod, "shift"], "Print", lazy.spawn("flameshot gui -p /home/anrichtait/Pictures/screenshots/")),
        Key([mod, "shift"], "o", lazy.spawn("obsidian"), desc="Launch Obsidian"),
        Key([mod, "shift"], "m", lazy.spawn("/home/anrichtait/.config/qtile/scripts/focus_mode.sh"), desc="Toggle Focus Mode"),
]
