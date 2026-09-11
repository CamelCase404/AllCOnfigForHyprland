hl.config({
    -- ───────── Базовые настройки окон (General) ─────────
    general = {
        border_size             = 2,
        gaps_in                 = 3,
        gaps_out                = 13,
        float_gaps              = 6,
        resize_on_border        = true,
        extend_border_grab_area = 30,
        allow_tearing           = false,
        layout                  = "dwindle",

        -- Цвета рамок (Перевод $active_border в нативный градиент)
        col = {
            active_border   = { colors = {"rgba(ffffffee)", "rgba(ffffffee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
    },

    -- ───────── Эффекты декораций (Decoration) ─────────
decoration = {
        rounding         = 10,
        rounding_power   = 7,
        active_opacity   = 1.0,
        inactive_opacity = 0.9,
	fullscreen_opacity = 1,
        shadow = {
            enabled = false,
        },

        -- Настройки размытия (Blur) с добавлением новых параметров
        blur = {
            enabled           = true,
            size              = 5,
            passes            = 2,
            new_optimizations = true,
            vibrancy          = 0.1696,
            xray              = true,  -- Просвечивание сквозь окна под прозрачными элементами
            ignore_opacity    = true,  -- ДОБАВЛЕННАЯ СТРОКА: размытие игнорирует прозрачность окна
        },    },

    -- ───────── Разное и Экосистема (Misc & Ecosystem) ─────────
    misc = {
        font_family              = "JetBrains Mono",
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        force_default_wallpaper  = 0,
        allow_session_lock_restore = true,
        always_follow_on_dnd = true,    },

    ecosystem = {
        no_update_news   = true,
        no_donation_nag  = true,
    },

    cursor = {
        no_warps            = true,
        no_hardware_cursors = true, -- Защита от мигания на NVIDIA
        use_cpu_buffer      = true,
    },
})

hl.config({ animations = { enabled = true } })

-- Регистрация ваших кастомных кривых Безье (точки x1, y1, x2, y2 переведены в таблицы параметров)
hl.curve("fluentIn",      { type = "bezier", points = { {0.05, 0.9},  {0.1, 1.0}  } })
hl.curve("fluentOut",     { type = "bezier", points = { {0.3, 0},     {0.8, 0.15} } })
hl.curve("layerCurveIn",  { type = "bezier", points = { {0.1, 0.9},  {0.2, 1.0}  } })
hl.curve("wsSmooth",      { type = "bezier", points = { {0.25, 1},    {0.2, 1}    } })
hl.curve("moveSmooth",    { type = "bezier", points = { {0.15, 0.85}, {0.1, 1.0}  } })
hl.curve("wsBounce",      { type = "bezier", points = { {0.18, 1.15}, {0.32, 1.0} } })

-- Применение анимаций к элементам интерфейса согласно вашим скоростям
hl.animation({ leaf = "windows",       enabled = true, speed = 7,  bezier = "fluentIn",     style = "popin 1%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 6,  bezier = "fluentOut",    style = "popin 60%" })
hl.animation({ leaf = "windowsMove",   enabled = true, speed = 12, bezier = "moveSmooth" })
hl.animation({ leaf = "layers",        enabled = true, speed = 6,  bezier = "layerCurveIn", style = "fade" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 6,  bezier = "layerCurveIn", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 5,  bezier = "fluentOut",    style = "fade" })
hl.animation({ leaf = "fade",          enabled = true, speed = 6,  bezier = "layerCurveIn" })

-- Анимация воркспейсов (Эффект перелистывания с пружиной смартфона)
hl.animation({ leaf = "workspaces",    enabled = true, speed = 8,  bezier = "wsBounce",     style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 8,  bezier = "wsBounce",     style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 8,  bezier = "wsBounce",     style = "slide" })
-- Кривая (плавный старт, мягкое дотягивание в конце)
hl.curve("fluentIn", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.0} } })

