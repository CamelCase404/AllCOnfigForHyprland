hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1.0,
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

        sensitivity = 0.3, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})
