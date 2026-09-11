hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@75",
    position = "0x0",
    scale    = "1",
})
hl.config({
    input = {
        -- ИСПРАВЛЕНИЕ: Включаем две раскладки (американскую и русскую)
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        -- ИСПРАВЛЕНИЕ: Задаем комбинацию клавиш для переключения раскладки
        kb_options = "grp:win_space_toggle",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = -0.7, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})
