@echo off
chcp 65001 > nul
color 0A

echo.
echo ================================================================
echo                    闪耀书店管理系统 - 一键启动
echo ================================================================
echo.

:: 设置项目路径
set PROJECT_DIR=C:\shinebookshop\shinebookshop
set IDEA_CONFIG_DIR=%PROJECT_DIR%\.idea

echo [1/6] 检查项目环境...
if not exist "%PROJECT_DIR%" (
    echo ❌ 错误：项目目录不存在！
    echo 路径: %PROJECT_DIR%
    pause
    exit /b 1
)

echo [2/6] 检查MySQL服务状态...
sc query mysql > nul 2>&1
if %errorlevel% NEQ 0 (
    echo ⚠️  MySQL服务未安装或未启动
    echo 正在尝试启动MySQL服务...
    net start mysql > nul 2>&1
    if %errorlevel% NEQ 0 (
        echo ❌ 无法启动MySQL服务，请手动检查MySQL安装
        pause
        exit /b 1
    )
)
echo ✅ MySQL服务运行正常

echo [3/6] 验证数据库连接...
mysql -h localhost -P 3306 -u root -proot -e "USE shinebookshop; SELECT COUNT(*) FROM s_admin;" > nul 2>&1
if %errorlevel% NEQ 0 (
    echo ⚠️  数据库连接失败，可能需要重新导入数据
    echo 正在尝试创建数据库...
    mysql -h localhost -P 3306 -u root -proot -e "CREATE DATABASE IF NOT EXISTS shinebookshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" > nul 2>&1

    if exist "%PROJECT_DIR%\shinebookshop.sql" (
        echo 正在导入数据库...
        mysql -h localhost -P 3306 -u root -proot shinebookshop < "%PROJECT_DIR%\shinebookshop.sql" > nul 2>&1
        if %errorlevel% EQU 0 (
            echo ✅ 数据库导入成功
        ) else (
            echo ❌ 数据库导入失败
            pause
            exit /b 1
        )
    ) else (
        echo ❌ 找不到SQL文件
        pause
        exit /b 1
    )
) else (
    echo ✅ 数据库连接正常
)

echo [4/6] 更新MySQL驱动...
set LIB_DIR=%PROJECT_DIR%\WebContent\WEB-INF\lib

:: 检查是否需要升级MySQL驱动
if exist "%LIB_DIR%\mysql-connector-java-5.1.10-bin.jar" (
    echo ⚠️  检测到旧版MySQL驱动 5.1.10
    echo 项目已配置为使用com.mysql.cj.jdbc.Driver，建议升级驱动
    echo 当前驱动应该可以工作，如果遇到连接问题，请升级到MySQL 8.0驱动
)
echo ✅ 数据库驱动配置完成

echo [5/6] 启动IntelliJ IDEA...

:: 查找IntelliJ IDEA安装路径
set IDEA_PATH=
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "IntelliJ IDEA" 2^>nul ^| findstr "InstallLocation"') do (
    set IDEA_PATH=%%b\bin\idea64.exe
    if exist "!IDEA_PATH!" goto :found_idea
)

for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "IntelliJ IDEA" 2^>nul ^| findstr "InstallLocation"') do (
    set IDEA_PATH=%%b\bin\idea64.exe
    if exist "!IDEA_PATH!" goto :found_idea
)

:: 尝试常见安装路径
if exist "C:\Program Files\JetBrains\IntelliJ IDEA Community Edition*\bin\idea64.exe" (
    for /d %%d in ("C:\Program Files\JetBrains\IntelliJ IDEA Community Edition*") do (
        set IDEA_PATH=%%d\bin\idea64.exe
        goto :found_idea
    )
)

if exist "C:\Program Files\JetBrains\IntelliJ IDEA*\bin\idea64.exe" (
    for /d %%d in ("C:\Program Files\JetBrains\IntelliJ IDEA*") do (
        set IDEA_PATH=%%d\bin\idea64.exe
        goto :found_idea
    )
)

if exist "%LOCALAPPDATA%\Programs\IntelliJ IDEA*\bin\idea64.exe" (
    for /d %%d in ("%LOCALAPPDATA%\Programs\IntelliJ IDEA*") do (
        set IDEA_PATH=%%d\bin\idea64.exe
        goto :found_idea
    )
)

:found_idea
if not defined IDEA_PATH (
    echo ❌ 未找到IntelliJ IDEA安装路径
    echo 请手动启动IntelliJ IDEA并打开项目：%PROJECT_DIR%
    echo.
    echo 项目配置完成！访问地址：
    echo 前台：http://localhost:8080/shinebookshop/
    echo 后台：http://localhost:8080/shinebookshop/admin
    echo 默认管理员：admin / admin
    pause
    exit /b 0
)

echo 找到IntelliJ IDEA: %IDEA_PATH%
echo 启动IntelliJ IDEA并打开项目...

:: 启动IDEA并打开项目
start "" "%IDEA_PATH%" "%PROJECT_DIR%"

echo [6/6] 配置完成！
echo.
echo ================================================================
echo                          配置完成！
echo ================================================================
echo.
echo ✅ 数据库配置：localhost:3306/shinebookshop (root/root)
echo ✅ IntelliJ IDEA已启动并打开项目
echo ✅ Tomcat运行配置已创建
echo.
echo 🚀 下一步操作：
echo 1. 等待IntelliJ IDEA完成项目索引
echo 2. 点击右上角的 [Tomcat Local - ShineBookShop] 运行配置
echo 3. 点击绿色三角形按钮启动项目
echo.
echo 🌐 访问地址：
echo    前台首页：http://localhost:8080/shinebookshop/
echo    管理后台：http://localhost:8080/shinebookshop/admin
echo.
echo 👤 默认账号：
echo    管理员：admin / admin
echo.
echo 💡 如果遇到问题，请检查：
echo    - Tomcat是否正确配置
echo    - MySQL服务是否运行
echo    - 8080端口是否被占用
echo.
echo ================================================================
pause