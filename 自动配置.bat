@echo off
echo ================================
echo Shine书店项目自动配置脚本
echo ================================

echo.
echo 第1步: 检查MySQL服务状态...
sc query mysql >nul 2>&1
if %errorlevel% neq 0 (
    echo MySQL服务未安装或未运行，请先启动MySQL服务
    pause
    exit /b 1
)

echo MySQL服务正在运行 ✓

echo.
echo 第2步: 创建数据库和导入数据...
echo 请输入MySQL root用户密码（如果没有密码直接回车）:
set /p password=

if "%password%"=="" (
    mysql -u root -e "DROP DATABASE IF EXISTS shinebookshop; CREATE DATABASE shinebookshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    mysql -u root shinebookshop < shinebookshop.sql
) else (
    mysql -u root -p%password% -e "DROP DATABASE IF EXISTS shinebookshop; CREATE DATABASE shinebookshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    mysql -u root -p%password% shinebookshop < shinebookshop.sql
)

if %errorlevel% neq 0 (
    echo 数据库操作失败，请检查MySQL密码或服务状态
    pause
    exit /b 1
)

echo 数据库创建和导入完成 ✓

echo.
echo 第3步: 更新数据库配置文件...
if not "%password%"=="" (
    powershell -Command "(gc src\dbinfo.properties) -replace 'DB_PASSWORD=root', 'DB_PASSWORD=%password%' | Out-File -encoding UTF8 src\dbinfo.properties"
)
echo 数据库配置文件更新完成 ✓

echo.
echo ================================
echo 配置完成！
echo ================================
echo.
echo 现在您可以：
echo 1. 在IntelliJ IDEA中打开项目: %CD%
echo 2. 配置Tomcat服务器
echo 3. 运行项目
echo.
echo 项目访问地址: http://localhost:8080/shinebookshop
echo 管理员登录: http://localhost:8080/shinebookshop/admin
echo 默认管理员账号: admin / admin
echo.
pause