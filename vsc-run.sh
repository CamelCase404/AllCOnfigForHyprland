#!/bin/bash

# Получаем аргументы от VS Code
FILE_PATH="$1"
FILE_EXT="$2"
FILE_DIR="$3"
FILE_NAME_NO_EXT="$4"
WORKSPACE_DIR="$5"

clear
start_time=$(date +%s.%N)

# 1. Если это C++
if [ "$FILE_EXT" = ".cpp" ] || [ "$FILE_EXT" = "cpp" ]; then
    echo "==== Compiling & Running C++ ===="
    g++ -O3 "$FILE_PATH" -o "$FILE_DIR/$FILE_NAME_NO_EXT" && "$FILE_DIR/$FILE_NAME_NO_EXT"

# 2. Если это Python
elif [ "$FILE_EXT" = ".py" ] || [ "$FILE_EXT" = "py" ]; then
    echo "==== Running Python ===="
    python3 "$FILE_PATH"

# 3. НОВОЕ: Если это HTML (фронтенд)
elif [ "$FILE_EXT" = ".html" ] || [ "$FILE_EXT" = "html" ]; then
    echo "==== Opening HTML in Browser ===="
    xdg-open "$FILE_PATH"

# 4. Для всех остальных случаев (C# / ASP.NET Core)
else
    echo "==== Running C# / ASP.NET ===="
    # Если запуск произошел из файла внутри проекта, но dotnet run нужно вызвать в корне
    if [ -n "$WORKSPACE_DIR" ] && [ "$WORKSPACE_DIR" != "undefined" ]; then
        cd "$WORKSPACE_DIR" && dotnet run
    else
        cd "$FILE_DIR" && dotnet run
    fi
fi

# Считаем и выводим время
exit_code=$?
end_time=$(date +%s.%N)
total_time=$(echo "$end_time - $start_time" | bc 2>/dev/null || awk "BEGIN {print $end_time - $start_time}")

echo -e "\n----------------------------------------"
echo "[Process finished with exit code $exit_code in ${total_time:0:5}s]"
