@echo off
setlocal enabledelayedexpansion

rem Nombre del script actual
set "script_name=%~nx0"

rem Recorre todos los archivos en la carpeta actual
for %%f in (*) do (
    rem Ignora el archivo del script
    if /I "%%~nxf" neq "%script_name%" (
        set "ext=%%~xf"
        set "ext=!ext:~1!"

        rem Crea la carpeta si no existe
        if not exist "!ext!" (
            echo Creando carpeta !ext!
            mkdir "!ext!"
        )

        rem Mueve el archivo a la carpeta correspondiente
        echo Moviendo archivo %%f a !ext!\%%f
        move "%%f" "!ext!\"
    )
)

echo.
echo Operación completada. Presione Enter para continuar...
pause >nul
