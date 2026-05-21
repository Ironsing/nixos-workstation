#!/usr/bin/env zsh

if pidof yad > /dev/null; then
    pkill yad
fi

yad --center --title="Keybinding Hints" --no-buttons --list \
    --column=Key: --column="" --column=Description: \
    --timeout-indicator=bottom \
"  =  Ctrl "          "        "  "MAIN MODIFIER (Ctrl)" \
"" "" "" \
"  H"              "        "  "Show keybinding hints" \
"  Space"          "        "  "Open terminal" \
"  F"              "        "  "Open file manager" \
"  B"              "        "  "Open browser" \
"  E"              "        "  "Open editor" \
"" "" "" \
"  Shift Ctrl Esc" "        "  "Exit Hyprland" \
"  Q"              "        "  "Close active window" \
"  Shift Q"        "        "  "Kill active window by PID" \
"" "" "" \
"  Shift F"              "        "  "Toggle floating" \
"  P"              "        "  "Toggle pseudo (dwindle)" \
"  J"              "        "  "Toggle split (dwindle)" \
"" "" "" \
"  L"              "        "  "Lock screen" \
"ALT Space"         "        "  "App launcher" \
"  ."              "        "  "Emoji selector" \
"  V"              "        "  "Clipboard manager" \
"  W"              "        "  "Choose wallpaper" \
"  Shift W"        "        "  "Random wallpaper" \
"  Shift S"        "        "  "Screenshot (region)" \
"" "" "" \
"  [1 -> 0]"       "        "  "Switch workspace 1-10" \
"  Shift [1 -> 0]" "        "  "Move window to workspace 1-10" \
"" "" "" \
"All bindings"   "        "  "$HOME/.config/hypr/conf/keybinding.conf"
