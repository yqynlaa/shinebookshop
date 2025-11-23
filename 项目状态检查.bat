@echo off
chcp 65001 > nul
color 0B

echo.
echo ================================================================
echo                    项目状态检查工具
echo ================================================================
echo.

set PROJECT_DIR=C:\shinebookshop\shinebookshop

echo 📁 项目路径检查...
if exist "%PROJECT_DIR%" (
    echo ✅ 项目目录存在: %PROJECT_DIR%
) else (
    echo ❌ 项目目录不存在: %PROJECT_DIR%
    pause
    exit /b 1
)

echo.
echo 📊 MySQL服务检查...
sc query mysql > nul 2>&1
if %errorlevel% EQU 0 (
    echo ✅ MySQL服务已安装
    for /f "tokens=3" %%a in ('sc query mysql ^| findstr STATE') do (
        if "%%a"=="RUNNING" (
            echo ✅ MySQL服务正在运行
        ) else (
            echo ⚠️  MySQL服务已安装但未运行
        )
    )
) else (
    echo ❌ MySQL服务未安装或无法访问
)

echo.
echo 🗄️ 数据库连接检查...
mysql -h localhost -P 3306 -u root -proot -e "SELECT 'Database connection successful' as status;" > nul 2>&1
if %errorlevel% EQU 0 (
    echo ✅ 数据库连接成功

    mysql -h localhost -P 3306 -u root -proot -e "USE shinebookshop; SELECT COUNT(*) as admin_count FROM s_admin;" > nul 2>&1
    if %errorlevel% EQU 0 (
        echo ✅ 数据库 shinebookshop 存在且包含数据
    ) else (
        echo ⚠️  数据库连接成功但shinebookshop数据库可能为空
    )
) else (
    echo ❌ 数据库连接失败 (用户名/密码: root/root)
)

echo.
echo 📋 项目文件检查...
if exist "%PROJECT_DIR%\src\dbinfo.properties" (
    echo ✅ 数据库配置文件存在
) else (
    echo ❌ 数据库配置文件缺失
)

if exist "%PROJECT_DIR%\WebContent\WEB-INF\web.xml" (
    echo ✅ Web配置文件存在
) else (
    echo ❌ Web配置文件缺失
)

if exist "%PROJECT_DIR%\.idea" (
    echo ✅ IntelliJ IDEA配置存在
) else (
    echo ❌ IntelliJ IDEA配置缺失
)

if exist "%PROJECT_DIR%\.idea\runConfigurations\Tomcat_Local_ShineBookShop.xml" (
    echo ✅ Tomcat运行配置存在
) else (
    echo ❌ Tomcat运行配置缺失
)

echo.
echo 📚 项目依赖检查...
set JAR_COUNT=0
for %%f in ("%PROJECT_DIR%\WebContent\WEB-INF\lib\*.jar") do set /a JAR_COUNT+=1
echo ✅ JAR依赖库数量: %JAR_COUNT%

if exist "%PROJECT_DIR%\WebContent\WEB-INF\lib\mysql-connector-java*.jar" (
    echo ✅ MySQL驱动存在
) else (
    echo ❌ MySQL驱动缺失
)

echo.
echo ================================================================
echo                        检查完成
echo ================================================================
echo.
echo 如果所有项目都显示 ✅，您可以直接运行 "一键启动.bat"
echo 如果有 ❌ 项目，请先解决相关问题
echo.
pause