if not set -q TERM_PROGRAM; or test "$TERM_PROGRAM" != "vscode"
    fastfetch
end
if test "$TERM" = "xterm-kitty"
    # Переключаем основную клавиатуру на английскую (индекс 0)
    hyprctl switchxkblayout ganss-ardor-wakizashi 0 > /dev/null 2>&1
    hyprctl switchxkblayout ganss-ardor-wakizashi-1 0 > /dev/null 2>&1
end
