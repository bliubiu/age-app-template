# 技术栈选型指南

> 本文档提供多语言技术栈的选型参考。新项目根据实际需求从中选择合适的技术组合。

---

## 架构设计原则

- **SOLID** 五原则
- **DRY / KISS / YAGNI**
- 高内聚低耦合
- **DDD（领域驱动设计）**：默认采用端口适配器架构（接口层、应用层、领域层、基础设施层）
- **TDD（测试驱动开发）**：红-绿-重构循环

---

## 项目结构（DDD 四层架构）

```
{{PROJECT_NAME}}/
├── docs/                         # 项目文档
├── internal/
│   ├── interfaces/               # 接口层：外部接口
│   ├── application/              # 应用层：用例和应用服务
│   ├── domain/                   # 领域层：核心业务逻辑和领域模型
│   └── infrastructure/           # 基础设施层：外部依赖实现
├── tests/                        # 测试代码
│   ├── unit/                     # 单元测试
│   ├── integration/              # 集成测试
│   └── e2e/                      # 端到端测试
├── deployments/                  # 部署配置
│   ├── docker/                   # Docker 部署
│   └── k8s/                      # Kubernetes 部署
├── configs/                      # 配置文件
├── scripts/                      # 构建/部署脚本
├── AGENTS.md                     # AI 行为契约
├── CHANGELOG.md                  # 变更日志
└── README.md                     # 项目概述
```

---

## 前端技术栈

### 框架选择

| 框架      | 适用场景                               |
| :-------- | :------------------------------------- |
| **Next.js** | React 全栈框架，SSR/企业官网/电商/SEO |
| **Nuxt**  | Vue 全栈框架，SSR/官网/博客           |
| **Vue3**  | 中小企业、后台、移动端                 |
| **React** | 大厂、复杂业务、跨端                   |
| **Astro** | 静态官网、文档、博客、内容站           |

### 推荐技术组合

- **框架**：Next.js 最新稳定版（App Router 模式）
- **语言**：TypeScript 7.x（严格模式）
- **样式**：Tailwind CSS
- **UI 组件**：shadcn/ui
- **包管理器**：pnpm
- **状态管理**：
  - 服务端状态：TanStack Query (React Query)
  - 客户端状态：Zustand
- **表单**：React Hook Form + Zod
- **动画**：Framer Motion
- **图表**：ECharts（按需引入）
- **测试**：Vitest + React Testing Library + Playwright
- **构建**：Vite

---

## 后端技术栈

### ☕ Java

- **框架**：Spring Boot 3.x + Spring Cloud
- **构建**：Gradle（Kotlin DSL）
- **ORM**：MyBatis-Plus
- **工具**：Lombok + MapStruct
- **测试**：JUnit 5 + Mockito + AssertJ

### 🐹 Go

- **微服务**：Kratos（DDD 友好）
- **CLI**：spf13/cobra
- **配置**：Viper
- **日志**：uber-go/zap
- **ORM**：GORM / sqlx
- **依赖注入**：wire
- **测试**：testify + gomock

### 🐍 Python

- **全栈**：Django 5+
- **轻量 API**：FastAPI
- **包管理**：UV
- **ORM**：SQLAlchemy 2.0 / Django ORM
- **验证**：Pydantic V2
- **测试**：pytest + pytest-cov

### 🦀 Rust

- **Web 框架**：Rocket / Axum / Actix-web
- **CLI**：clap
- **数据库**：SQLx / Diesel
- **异步**：tokio
- **序列化**：serde
- **桌面**：Tauri 2
- **测试**：内置 `#[test]` + proptest

---

## 数据库与中间件

### 关系数据库

- **PostgreSQL 17+**：默认选择

### 缓存

- **Redis 7.x**

### 消息队列

- **Kafka**：高吞吐日志处理
- **RabbitMQ**：可靠消息 RPC
- **Redis Stream**：轻量级消息队列

### ORM/数据库工具

| 语言       | ORM/工具        | 配合框架         |
| :--------- | :-------------- | :--------------- |
| TypeScript | Prisma          | Next.js          |
| Java       | MyBatis-Plus    | Spring Boot      |
| Go         | GORM            | Kratos/Beego     |
| Python     | SQLAlchemy      | FastAPI/Django   |
| Rust       | SQLx/Diesel     | Rocket/Actix-web |

---

## 可观测性

- **链路追踪**：Jaeger（OpenTelemetry 协议）
- **监控**：Prometheus + Grafana

---

## 配置中心

| 配置中心 | 适用语言       | 特点                |
| :------- | :------------- | :------------------ |
| Nacos    | Java/Go/Python | 配置+服务发现双功能 |
| Apollo   | Java/.NET      | 配置管理功能最强    |
| Consul   | 多语言         | KV 存储             |

---

## 网关与接入

- **APISIX**：多语言异构系统（推荐）
- **Spring Cloud Gateway**：Java 微服务集群
- **Kong**：存量系统对接

---

## 容器化与编排

- **Docker**：多阶段构建
- **Kubernetes**：命名空间隔离 + Kustomize 环境差异化

---

## TUI 技术栈（终端界面）

| 语言   | 框架                          | 适用场景             |
| :----- | :---------------------------- | :------------------- |
| Go     | Bubble Tea + Lip Gloss        | 企业级首选，最稳     |
| Rust   | Ratatui + Tui-Realm           | 极致性能，系统工具   |
| Python | Textual + Rich                | 快速开发，原型首选   |

---

## 桌面技术栈

- **Tauri 2**：跨平台桌面应用（Rust 后端 + Web 前端）

---

## 安全技术栈

- **国密合规**：SM4-GCM-SIV 加密
- **非国密**：AES-256-GCM / XChaCha20-Poly1305
- **密钥管理**：K8s Secrets + 加密工具（Sealed Secrets）
- **API 防护**：速率限制 + 请求签名验证 + 输入验证