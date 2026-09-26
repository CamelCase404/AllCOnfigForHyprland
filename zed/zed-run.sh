#!/bin/bash

# 1. Получаем базовые аргументы от Zed
FILE_PATH="$1"
WORKSPACE_DIR="$2"

# 2. Мгновенно вычисляем остальные пути средствами самого Linux
FILE_DIR=$(dirname "$FILE_PATH")
FILE_BASENAME=$(basename "$FILE_PATH")
FILE_EXT=".${FILE_BASENAME##*.}"
FILE_NAME_NO_EXT="${FILE_BASENAME%.*}"

clear
start_time=$(date +%s.%N)

# 3. Если это C++
if [ "$FILE_EXT" = ".cpp" ]; then
    echo "==== Compiling & Running C++ ===="
    g++ -O3 "$FILE_PATH" -o "$FILE_DIR/$FILE_NAME_NO_EXT" && "$FILE_DIR/$FILE_NAME_NO_EXT"

# 4. Если это Python (Автоматический venv)
elif [ "$FILE_EXT" = ".py" ]; then
    echo "==== Python Environment Setup ===="
    
    # Определяем, где создавать .venv (в корне воркспейса или в папке файла)
    if [ -n "$WORKSPACE_DIR" ] && [ "$WORKSPACE_DIR" != "undefined" ]; then
        ENV_DIR="$WORKSPACE_DIR/.venv"
    else
        ENV_DIR="$FILE_DIR/.venv"
    fi

    # Если venv не существует — создаем его
    if [ ! -d "$ENV_DIR" ]; then
        echo "Creating virtual environment in: $ENV_DIR..."
        python3 -m venv "$ENV_DIR"
        
        # Обновляем pip внутри нового venv
        echo "Updating pip..."
        "$ENV_DIR/bin/pip" install --upgrade pip
    fi

    echo "==== Running Python (Venv Active) ===="
    # Запускаем файл напрямую через python из venv (это исключает необходимость делать source activate)
    "$ENV_DIR/bin/python3" "$FILE_PATH"

# 5. Если это HTML (фронтенд)
elif [ "$FILE_EXT" = ".html" ]; then
    echo "==== Opening HTML in Browser ===="
    xdg-open "$FILE_PATH"

# 6. Для всех остальных случаев (C# / ASP.NET Core)
else
    echo "==== Running C# / ASP.NET ===="
    
    TARGET_DIR="$FILE_DIR"
    CSPROJ_FILE=""

    # Ищем .csproj файл, поднимаясь вверх от папки файла до корня воркспейса
    while [ "$TARGET_DIR" != "/" ] && [ -n "$TARGET_DIR" ]; do
        # Ищем первый попавшийся .csproj в текущей папке TARGET_DIR
        CSPROJ_FILE=$(find "$TARGET_DIR" -maxdepth 1 -name "*.csproj" -print -quit 2>/dev/null)
        
        if [ -n "$CSPROJ_FILE" ]; then
            break
        fi
        
        # Если дошли до корня воркспейса и ничего не нашли — останавливаемся
        if [ "$TARGET_DIR" = "$WORKSPACE_DIR" ]; then
            break
        fi
        
        # Поднимаемся на уровень выше
        TARGET_DIR=$(dirname "$TARGET_DIR")
    done

    # Если нашли проект, запускаем его. Если нет — пробуем запуститься из WORKSPACE_DIR
    if [ -n "$CSPROJ_FILE" ]; then
        echo "Found project: $CSPROJ_FILE"
        dotnet run --project "$CSPROJ_FILE"
    elif [ -n "$WORKSPACE_DIR" ] && [ "$WORKSPACE_DIR" != "undefined" ]; then
        cd "$WORKSPACE_DIR" && dotnet run
    else
        cd "$FILE_DIR" && dotnet run
    fi
fi

# 7. Считаем и выводим время работы
exit_code=$?
end_time=$(date +%s.%N)
total_time=$(echo "$end_time - $start_time" | bc 2>/dev/null || awk "BEGIN {print $end_time - $start_time}")

echo -e "\n----------------------------------------"
echo "[Process finished with exit code $exit_code in ${total_time:0:5}s]"
