# 闪耀书店管理系统 - 一键启动指南

## 🚀 快速启动

1. **双击运行** `一键启动.bat`
2. **等待脚本完成**所有配置
3. **IntelliJ IDEA会自动打开**项目
4. **点击运行按钮**启动项目

## 📋 使用说明

### 自动化脚本

- **`一键启动.bat`** - 完整的自动化启动脚本
- **`项目状态检查.bat`** - 检查项目环境和配置状态

### 访问地址

- **前台首页**: http://localhost:8080/shinebookshop/
- **管理后台**: http://localhost:8080/shinebookshop/admin

### 默认账号

- **管理员**: admin / admin

## ⚙️ 系统要求

- ✅ Java 1.8+
- ✅ MySQL 5.7+ / 8.0+
- ✅ IntelliJ IDEA
- ✅ Apache Tomcat 8.5+

## 🔧 已完成的自动化配置

1. ✅ **数据库连接配置** - 自动优化MySQL 8.0兼容性
2. ✅ **IntelliJ IDEA项目配置** - 自动生成运行配置
3. ✅ **Tomcat运行配置** - 一键启动Web服务器
4. ✅ **依赖库管理** - 所有JAR包已配置
5. ✅ **编码设置** - UTF-8字符编码
6. ✅ **数据库检查** - 自动验证并导入数据

## 🐛 问题排查

如果遇到问题，请按顺序检查：

1. **运行** `项目状态检查.bat` 查看详细状态
2. **检查MySQL服务** - 确保服务运行正常
3. **验证端口占用** - 确保8080端口未被占用
4. **确认Tomcat配置** - 在IntelliJ IDEA中配置Tomcat服务器

## 📁 项目结构

```
shinebookshop/
├── 一键启动.bat          # 主启动脚本
├── 项目状态检查.bat      # 状态检查工具
├── src/                  # Java源代码
├── WebContent/           # Web资源
├── .idea/               # IntelliJ IDEA配置
└── shinebookshop.sql    # 数据库脚本
```

---

**🎯 目标达成**: 您现在只需要双击 `一键启动.bat`，然后在IDEA中点击运行按钮即可！