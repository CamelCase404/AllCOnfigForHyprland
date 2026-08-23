-- For Noctalia Color templates
require("noctalia").apply_theme()   
hl.window_rule({
    name    = "vscode-blur",
    match   = { class = "^(code|code-url-handler)$" },
    opacity = "1 override 0.85 override", -- Прозрачность автоматически вызовет блюр композитора
})
-- Идеальное решение для дока Noctalia Shell v5
-- Официальное исправление блюра для Noctalia v5
-- Единое оптимизированное правило для всех слоев Noctalia v5
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
