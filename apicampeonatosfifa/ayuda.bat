@echo off
echo ================================================
echo 🏆 API CAMPEONATOS FIFA - AYUDA RAPIDA
echo ================================================
echo.
echo [1] Ejecutar aplicación
echo [2] Compilar proyecto  
echo [3] Probar API
echo [0] Salir
echo.

:menu
set /p choice="Selecciona opción (0-3): "

if "%choice%"=="1" goto run_app
if "%choice%"=="2" goto compile
if "%choice%"=="3" goto test_api
if "%choice%"=="0" goto end
goto menu

:run_app
echo.
echo 🚀 Ejecutando aplicación...
call mvnw spring-boot:run
goto end

:compile
echo.
echo 🔨 Compilando proyecto...
call mvnw clean compile
echo ✅ Compilación completada
pause
goto menu

:test_api
echo.
echo 🧪 Probando endpoints...
echo.
echo 📋 Campeonatos:
curl -s http://localhost:8080/campeonatos/listar
echo.
echo.
echo 🏆 Grupos:
curl -s http://localhost:8080/campeonatos/2/grupos
echo.
pause
goto menu

:end
exit
if "%choice%"=="4" goto verify_db
if "%choice%"=="5" goto test_endpoints
if "%choice%"=="6" goto view_logs
if "%choice%"=="0" goto exit
echo ❌ Opción inválida. Intenta de nuevo.
goto menu

:run_app
echo.
echo 🚀 Ejecutando la aplicación...
echo 📍 La aplicación estará disponible en: http://localhost:8080
echo 🛑 Presiona Ctrl+C para detener la aplicación
echo.
mvnw spring-boot:run
goto menu

:compile
echo.
echo 🔨 Compilando el proyecto...
mvnw compile
echo ✅ Compilación completada
goto menu

:clean_compile
echo.
echo 🧹 Limpiando y compilando el proyecto...
mvnw clean package
echo ✅ Proyecto limpio y compilado
goto menu

:verify_db
echo.
echo 🗄️ Verificando conexión a la base de datos...
psql -U postgres -d campeonatosfifa -c "SELECT 'Conexión exitosa a campeonatosfifa' as status;"
if %ERRORLEVEL%==0 (
    echo ✅ Conexión a la base de datos exitosa
) else (
    echo ❌ Error al conectar con la base de datos
    echo 💡 Verifica que PostgreSQL esté ejecutándose
    echo 💡 Verifica que la base de datos 'campeonatosfifa' exista
)
goto menu

:test_endpoints
echo.
echo 🧪 Probando endpoints básicos...
echo.
echo 📊 Probando /campeonatos/listar...
curl -s http://localhost:8080/campeonatos/listar > nul
if %ERRORLEVEL%==0 (
    echo ✅ Endpoint campeonatos funcionando
) else (
    echo ❌ Error - Asegúrate de que la aplicación esté ejecutándose
)
echo.
echo 📈 Probando /grupos/1/posiciones...
curl -s http://localhost:8080/grupos/1/posiciones > nul
if %ERRORLEVEL%==0 (
    echo ✅ Endpoint grupos funcionando
) else (
    echo ❌ Error - Verifica que los datos estén poblados
)
goto menu

:view_logs
echo.
echo 📝 Instrucciones para ver logs:
echo.
echo 1. Los logs aparecen en la consola cuando ejecutas la aplicación
echo 2. Para logs detallados, modifica application.properties:
echo    logging.level.apicampeonatosfifa=DEBUG
echo 3. Los logs de SQL están habilitados por defecto
echo.
pause
goto menu

:exit
echo.
echo 👋 ¡Hasta luego! Que tengas un buen desarrollo.
echo.
exit /b 0
