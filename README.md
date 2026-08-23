hl.layer_rule({
    name         = "noctalia-shell-blur-fix",
    -- Используем точный групповой regex для отлова всех подслоев рендеринга Noctalia v5
    match        = { namespace = "^noctalia-(bar-[^\\\"]+|notification|dock|panel|attached-panel|osd)$" },
    blur         = true,              -- Включаем размытие фонa
    blur_popups  = true,              -- Размываем всплывающие OpenGL элементы внутри слоев
    ignore_alpha = 0.05,               -- Оставляем для уведомлений и OSD
    no_anim      = true,              -- КРИТИЧНО: Запрещаем Hyprland анимировать размытие.
                                      -- Noctalia v5 анимирует себя сама. Это мгновенно срежет артефакт!
})
