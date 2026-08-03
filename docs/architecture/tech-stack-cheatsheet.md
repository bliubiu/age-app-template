# 技术栈速查卡

> 快速查阅常用技术栈的依赖安装、测试、构建命令。
>
> **注意**：本模板强制使用 pnpm（禁用 npm）和 uv（禁用 pip/poetry），参见 `AGENTS.md` 约束条件。

---

## TypeScript / Node.js

### 初始化项目

```bash
# 新项目（使用 pnpm）
pnpm create vite my-app --template react-ts

# 或使用 create-ts-project
pnpm dlx create-ts-project my-app
```

### 依赖管理

```bash
# 安装依赖
pnpm install              # 安装全部依赖
pnpm add eslint           # 添加生产依赖
pnpm add -D eslint        # 添加开发依赖
pnpm add typescript@5.3   # 精确版本
```

### 常用脚本

```bash
# 开发
pnpm dev                  # 启动开发服务器
pnpm build                # 生产构建
pnpm preview              # 预览构建产物

# 质量
pnpm lint                 # 代码检查
pnpm lint --fix           # 自动修复
pnpm typecheck            # 类型检查

# 测试
pnpm test                 # 运行所有测试
pnpm test --watch         # 监听模式
pnpm test --coverage      # 覆盖率报告
pnpm test src/xxx         # 仅运行相关测试

# 其他
pnpm clean                # 清理构建产物
pnpm format               # 代码格式化
```

### 配置文件

| 配置 | 文件 | 说明 |
|------|------|------|
| TypeScript | `tsconfig.json` | 编译器选项 |
| ESLint | `eslint.config.js` | 代码规范 |
| Prettier | `.prettierrc` | 格式化 |
| Vitest | `vitest.config.ts` | 测试框架 |
| Vite | `vite.config.ts` | 构建工具 |

---

## Rust

### 初始化项目

```bash
# 新项目
cargo new my-project          # 二进制项目
cargo new my-project --lib    # 库项目
cargo init --name my-project  # 在当前目录初始化
```

### 依赖管理

```bash
# 添加依赖（在 Cargo.toml 中）
# [dependencies]
# serde = { version = "1.0", features = ["derive"] }

# 添加开发依赖
cargo add serde --dev

# 添加带 features 的依赖
cargo add tokio --features full
```

### 常用脚本

```bash
# 构建
cargo build                    # Debug 构建
cargo build --release          # Release 构建
cargo check                    # 仅检查不构建

# 运行
cargo run                      # 运行
cargo run --release            # 运行 release 版本
cargo run -- --arg1 --arg2     # 传递参数

# 测试
cargo test                     # 运行所有测试
cargo test module_name         # 运行特定模块
cargo test -- --nocapture      # 测试时显示输出
cargo test -- --test-threads=1 # 单线程测试

# 质量
cargo fmt                      # 格式化代码
cargo clippy                   # 代码检查
cargo clippy --fix             # 自动修复警告

# 文档
cargo doc                      # 生成文档
cargo doc --open               # 打开文档
```

### 配置文件

| 配置 | 文件 | 说明 |
|------|------|------|
| 依赖/元数据 | `Cargo.toml` | 项目配置 |
| 本地依赖 | `.cargo/config.toml` | Cargo 配置 |
| Clippy | `.clippy.toml` | Clippy 规则 |
| rustfmt | `rustfmt.toml` | 格式化规则 |

---

## Go

### 初始化项目

```bash
# 新项目
go mod init github.com/user/my-project

# 创建 main.go
```

### 依赖管理

```bash
# 添加依赖
go get github.com/gin-gonic/gin@v1.9.1

# 整理依赖
go mod tidy

# 升级依赖
go get -u ./...
go get -u github.com/gin-gonic/gin
```

### 常用脚本

```bash
# 构建
go build                      # 编译
go build -o my-app .          # 指定输出
go build -ldflags="-s -w" .   # 优化体积

# 运行
go run main.go                # 直接运行
go run .                      # 运行包

# 测试
go test                       # 运行所有测试
go test -v                    # 详细输出
go test -cover                # 覆盖率
go test -coverprofile=cover.out
go test ./pkg/...             # 特定包
go test -run TestName -v      # 特定测试

# 质量
go fmt ./...                  # 格式化
go vet ./...                  # 静态检查
goimports -w .                # 整理 import
staticcheck ./...             # 高级检查（需安装）

# 依赖
go mod verify                 # 验证依赖
go mod graph                  # 依赖关系
```

### 配置文件

| 配置 | 文件 | 说明 |
|------|------|------|
| 依赖/元数据 | `go.mod` | 模块配置 |
| 依赖锁定 | `go.sum` | 依赖校验 |
| linter | `.golangci.yml` | golangci-lint 配置 |

---

## Python

> **强制使用 uv 管理依赖**，禁止 pip/venv/pipenv/poetry。

### 初始化项目

```bash
# 使用 uv 创建项目
uv init my-project
cd my-project

# 添加依赖
uv add fastapi
uv add --dev pytest ruff mypy
```

### 依赖管理

```bash
# uv（唯一允许的包管理器）
uv add requests               # 添加生产依赖
uv add --dev pytest           # 添加开发依赖
uv add "fastapi>=0.100"       # 带版本约束
uv remove requests            # 移除依赖
uv sync                       # 同步依赖（按 lock 文件）
uv lock                       # 更新 lock 文件
```

### 常用脚本

```bash
# 运行
uv run python main.py         # 运行脚本
uv run uvicorn main:app       # 运行 Web 服务

# 测试
uv run pytest                 # 运行所有测试
uv run pytest -v              # 详细输出
uv run pytest --cov           # 覆盖率
uv run pytest -k "test_name"  # 特定测试
uv run pytest tests/xxx       # 特定目录

# 质量
uv run ruff check .           # 代码检查
uv run ruff format .          # 格式化
uv run mypy .                 # 类型检查
uv run pre-commit run         # 提交前检查

# 依赖
uv pip list                   # 列出依赖
uv pip check                  # 检查依赖一致性
```

### 配置文件

| 配置 | 文件 | 说明 |
|------|------|------|
| 项目配置 | `pyproject.toml` | 现代 Python 项目配置 |
| 依赖锁定 | `uv.lock` | 精确版本锁定 |

---

## Docker

### 常用命令

```bash
# 构建
docker build -t my-app:latest .
docker build -t my-app:v1.0 -f Dockerfile.prod .
docker buildx build --platform linux/amd64,linux/arm64 -t my-app .

# 运行
docker run -d -p 8080:8080 my-app:latest
docker run --rm -it my-app bash
docker run -e ENV=prod -v /data:/app/data my-app

# 调试
docker logs <container-id>
docker exec -it <container-id> bash
docker stats <container-id>
docker inspect <container-id>

# 清理
docker stop <container-id>
docker rm <container-id>
docker rmi <image-id>
docker system prune          # 清理所有未使用资源
```

### docker-compose.yml 模板

```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "8080:8080"
    environment:
      - NODE_ENV=production
    depends_on:
      - db
  db:
    image: postgres:16
    environment:
      POSTGRES_PASSWORD: example
    volumes:
      - pgdata:/var/lib/postgresql/data
volumes:
  pgdata:
```

---

## Git

### 常用命令

```bash
# 分支
git checkout -b feature/new-feature
git checkout main
git merge feature/new-feature
git branch -d feature/new-feature

# 提交
git add -A
git commit -m "feat: add new feature"
git commit --amend            # 修改最近提交
git commit --fixup=<sha>      # fixup 提交

# 远程
git push origin main
git pull --rebase origin main
git fetch origin

# 撤销
git reset --soft HEAD~1      # 撤销提交，保留暂存
git reset --hard HEAD~1      # 撤销提交和修改
git revert <commit>          # 创建反向提交
git stash                    # 暂存修改

# 日志
git log --oneline --graph
git diff main...HEAD          # 查看分支差异
git blame file.txt           # 查看每行变更
```

---

## 通用检查清单

### 新建项目

```
[ ] 选择技术栈
[ ] 初始化版本控制
[ ] 配置 linter/formatter
[ ] 配置 CI/CD
[ ] 编写第一个测试
[ ] 建立项目结构
```

### 提交代码

```
[ ] 代码已格式化
[ ] linter 无错误
[ ] 测试全部通过
[ ] 类型检查通过
[ ] 无敏感信息
[ ] 提交信息规范
```

### 代码审查

```
[ ] 审查规范（格式、命名）
[ ] 审查安全（依赖、权限）
[ ] 审查性能（算法、缓存）
[ ] 审查测试（覆盖率、边界）
[ ] 审查文档（API、README）
```