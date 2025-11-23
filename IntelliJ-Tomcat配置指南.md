# IntelliJ IDEA + Tomcat 配置指南

## 1. 在IntelliJ IDEA中配置Tomcat服务器

### 步骤1：添加Tomcat服务器配置
1. **Run → Edit Configurations...**
2. 点击 **"+"** → **Tomcat Server** → **Local**
3. 在 **Server** 标签页：
   - **Name**: Tomcat 8.5 (或你的版本)
   - **Application server**: 选择你的Tomcat安装目录
   - **HTTP port**: 8080 (默认)
   - **JMX port**: 1099 (默认)

### 步骤2：配置部署
1. 切换到 **Deployment** 标签页
2. 点击 **"+"** → **Artifact** → **shinebookshop:war exploded**
3. **Application context**: `/shinebookshop`

### 步骤3：配置启动页面
1. 在 **Server** 标签页
2. **On 'Update' action**: Update resources
3. **On frame deactivation**: Update resources
4. **Open browser**: 勾选
5. **URL**: `http://localhost:8080/shinebookshop`

## 2. 项目结构检查清单

### 必需的文件和目录
- ✅ `src/` - Java源代码
- ✅ `WebContent/` - Web资源根目录
- ✅ `WebContent/WEB-INF/web.xml` - Web应用配置
- ✅ `WebContent/WEB-INF/lib/` - JAR依赖库
- ✅ `src/dbinfo.properties` - 数据库配置

### 依赖库检查
- ✅ mysql-connector-java-5.1.10-bin.jar (MySQL驱动)
- ✅ json-lib-2.3-jdk15.jar (JSON处理)
- ✅ commons-* (Apache Commons工具库)
- ✅ jstl-1.2.jar (JSTL标签库)

## 3. 数据库配置验证

### 当前配置 (src/dbinfo.properties)
```properties
DB_URL=jdbc:mysql://localhost:3306/shinebookshop?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true&useSSL=false
DB_DRIVER=com.mysql.cj.jdbc.Driver
DB_USERNAME=root
DB_PASSWORD=root
```

### 修改密码步骤
如果您的MySQL密码不是"root"，请修改 `src/dbinfo.properties` 文件中的 `DB_PASSWORD` 值。

## 4. 启动前检查

### MySQL数据库
1. 确保MySQL服务正在运行
2. 验证数据库连接：
```bash
mysql -u root -p
use shinebookshop;
show tables;
```

### 项目编译
1. **Build → Build Project** 确保项目无编译错误
2. 检查 `build/classes` 目录是否有编译后的.class文件

## 5. 启动项目

### 第一次启动
1. 点击 **Run** 按钮 (绿色三角形)
2. 选择配置好的Tomcat服务器
3. 等待服务器启动完成
4. 浏览器会自动打开项目首页

### 访问地址
- **首页**: http://localhost:8080/shinebookshop
- **管理员**: http://localhost:8080/shinebookshop/admin

## 6. 故障排除

### 常见问题
1. **端口8080被占用**
   - 解决：修改Tomcat端口或结束占用进程

2. **数据库连接失败**
   - 检查MySQL服务状态
   - 验证用户名密码
   - 确认数据库名称正确

3. **404错误**
   - 检查部署配置
   - 确认Application context设置

4. **中文乱码**
   - 确保数据库字符集为UTF-8
   - 检查JSP页面编码设置

### 调试技巧
- 查看Tomcat控制台输出
- 检查IntelliJ IDEA的Messages窗口
- 使用浏览器开发者工具查看网络请求