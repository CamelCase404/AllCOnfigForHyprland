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




env

hl.on("hyprland.start", function()
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("systemctl --user enable --now easyeffects")
  hl.exec_cmd("serpantinumd start")
end)

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")


keybinds

local mainMod = _G.mainMod or "SUPER"
local terminal = _G.terminal or "kitty"

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.resize({ x = -200, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.resize({ x = 200, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.resize({ x = 0, y = -200, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.resize({ x = 0, y = 200, relative = true }), { repeating = true })

hl.bind(mainMod .. " + CTRL + Left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CTRL + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + CTRL + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CTRL + Down", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("serpantinum brightness lower"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("serpantinum brightness raise"), { locked = true })

hl.bind("Print", hl.dsp.exec_cmd("serpantinum screenshot"), { locked = true })
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("serpantinum screenshot --edit"), { locked = true })
hl.bind("SUPER + Print", hl.dsp.exec_cmd("serpantinum screenshot --full"), { locked = true })
hl.bind("SUPER + SHIFT + Print", hl.dsp.exec_cmd("serpantinum screenshot --full --edit"), { locked = true })

hl.bind("XF86PowerOff", hl.dsp.exec_cmd("serpantinum lock"), { locked = true })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("serpantinum lock"), { repeating = true, locked = true })

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("serpantinum volume mic-toggle"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("serpantinum volume mute-toggle"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("serpantinum volume lower"), { repeating = true, locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("serpantinum volume raise"), { repeating = true, locked = true })

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("serpantinum msg toggle launcher"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("serpantinum msg toggle clipboard"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("serpantinum msg toggle music"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("serpantinum msg toggle system"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("serpantinum msg toggle wallpaper"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("serpantinum msg toggle calendar"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("serpantinum msg toggle network"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("serpantinum msg toggle volume"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("serpantinum msg toggle guide"))

for i = 1, 10 do
  local ws = tostring(i)
  local key = tostring(i % 10)
  hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd("serpantinum msg workspace " .. ws))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.exec_cmd("serpantinum msg workspace " .. ws .. " move"))
end

monitors 

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


settings 

s.lua
hl.config({
    -- ───────── Базовые настройки окон (General) ─────────
    general = {
        border_size             = 2,
        gaps_in                 = 3,
        gaps_out                = 6,
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
        rounding         = 13,
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
    },

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

Variables 

mainMod = "SUPER"
terminal = "kitty"

hl.window_rule({
    name  = "kitty-opacity",
    match = { class = "^(kitty)$" },
    opacity = "0.85 override 0.85 override",
})
