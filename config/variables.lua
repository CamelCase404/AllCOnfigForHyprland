mainMod = "SUPER"
terminal = "kitty"

hl.window_rule({
    name  = "kitty-opacity",
    match = { class = "^(kitty)$" },
    opacity = "0.6 override 0.5 override 0.6 override",
})

