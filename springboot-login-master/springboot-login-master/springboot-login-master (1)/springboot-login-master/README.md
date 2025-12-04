# SpringBoot 登录注册系统

基于 Spring Boot 2.7 + MyBatis + Vue 3 的用户登录注册系统。

## 技术栈

- **后端**: Spring Boot 2.7.18 + MyBatis 2.3.2
- **前端**: Vue 3 (CDN) + 原生 CSS
- **数据库**: MySQL 8.x

## 快速开始

### 1. 创建数据库

执行 `src/main/resources/init.sql`：

```sql
CREATE DATABASE IF NOT EXISTS `login` DEFAULT CHARACTER SET utf8mb4;

USE `login`;

CREATE TABLE IF NOT EXISTS `user` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

### 2. 修改配置

编辑 `src/main/resources/application.yml`，修改数据库连接信息：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/login
    username: root
    password: 123456
```

### 3. 运行项目

在 IDE 中运行 `Application.java` 的 main 方法。

### 4. 访问

- 首页：http://localhost:9090/index.html
- 登录：http://localhost:9090/login.html
- 注册：http://localhost:9090/regist.html

## API 接口

| 接口 | 方法 | 说明 |
|------|------|------|
| `/user/login` | POST | 用户登录 |
| `/user/regist` | POST | 用户注册 |

## 项目结构

```
src/main/java/com/alibaba/
├── Application.java        # 启动类
├── bean/
│   ├── Result.java         # 统一响应封装
│   └── User.java           # 用户实体
├── controller/
│   └── UserController.java # 用户控制器
├── mapper/
│   └── UserMapper.java     # MyBatis Mapper
└── service/
    └── UserService.java    # 业务逻辑
```

## 环境要求

- JDK 17+
- MySQL 8.x
