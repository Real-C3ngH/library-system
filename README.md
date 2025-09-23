# Library Web 应用 - 本地与容器化部署

本项目为基于 Spring MVC + MyBatis + JSP 的传统 Java Web 应用（非 Maven/Gradle），已提供容器化方案与本机运行指引。

## 快速开始（Docker）

前置：已安装 Docker Desktop（macOS）。

1. 启动容器：

```bash
cd docker
docker compose up -d --build
```

2. 访问：

- 应用：http://localhost:8080/
- MySQL：localhost:3306，root/123456，数据库 library2

3. 停止：

```bash
# 优雅暂停（保留容器与数据）
./scripts/pause.sh

# 完全停止并清理（移除容器、网络等）
cd docker
docker compose down
```

说明：
- `docker/mysql/init.sql` 会创建数据库；`sql/library2.sql` 会自动导入表结构与数据，并默认插入管理员 admin/1。
- 应用镜像基于 `tomcat:9.0-jdk8`，将 `web` 目录部署为 ROOT 应用。
- 如需热更新 JSP/静态资源，compose 已将 `web/` 目录挂载到容器。

## 本机运行（不使用 Docker）

1. 安装环境
- JDK 8（或 11，若使用 11 需注意 Servlet API 兼容）
- 安装并启动本地 MySQL，创建库并导入 `sql/library2.sql`

2. 修改数据库连接（如有需要）
- 在 `src/config/spring/db.properties` 调整 `jdbc.url/jdbc.username/jdbc.password`

3. 部署到 Tomcat
- 安装 Tomcat 8/9
- 将 `web/` 作为 ROOT webapp 部署（或设置为某个 context path）
- 启动 Tomcat 后访问 http://localhost:8080/

## 常见问题
- 页面 404：确认 `web/WEB-INF/web.xml` 存在且 `DispatcherServlet` 映射为 `/`，确认 Tomcat 日志无启动错误。
- 数据库连接失败：检查容器网络下 `jdbc.url` 是否指向 `db`（容器）或 `localhost`（本机）。容器内访问同 compose 服务名 `db`。

## 容器内数据库连接（可选调整）
当前 `db.properties` 使用 `localhost:3306`。若应用和 MySQL 均在 Docker 中运行，应改为 `db:3306`。你可以创建一个容器专用配置文件并在镜像中覆盖，或在开发期保持本地连接。
