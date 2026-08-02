# AGE 应用开发模板

> **AGE = Attractor-Guided Engineering（吸引子引导工程）**

一套面向 AI 大规模应用开发的最佳实践模板。核心意图：**把仓库变成 AI 可持续工作的制度基础设施**，让 AI 在多 session、长周期、多角色协作中始终围绕文档这个"稳定吸引子"收敛。

---

## 快速开始

### 方式零：AI 对话初始化（最推荐）

克隆模板后，直接对 AI 说：

```
帮我初始化这个 AGE 模板项目
```

AI 会引导你填写项目名称、仓库地址、描述，然后自动完成所有占位符替换和清理。详见 `docs/skills/age-init.md`。

### 方式一：脚本初始化（推荐）

```bash
# 1. 克隆模板
git clone git@github.com:bliubiu/age-app-template.git my-new-project
cd my-new-project

# 2. 运行初始化脚本（交互模式）
.\init.ps1          # Windows
# 或
./init.sh           # Linux/Mac

# 3. 脚本会自动：
#    - 替换所有 {{PROJECT_NAME}}、{{REPO_URL}} 占位符
#    - 将剩余 {{...}} 替换为 <!-- TODO: ... --> 标记
#    - 清理自身（init.ps1/init.sh/init.config.json）
#    - 可选：初始化 Git 仓库
```

### 方式二：命令行参数（非交互）

```bash
# Windows
.\init.ps1 -ProjectName "my-app" -RepoUrl "git@github.com:user/my-app.git" -Description "我的应用" -Yes

# Linux/Mac
./init.sh -n "my-app" -r "git@github.com:user/my-app.git" -d "我的应用"
```

### 方式三：配置文件

```bash
# 编辑 init.config.json 填写项目信息，然后运行：
.\init.ps1 -Config init.config.json
```

### 初始化后检查清单

- [ ] 搜索 `<!-- TODO` 补充剩余内容
- [ ] 填写 `docs/backlog/` 第一个工作项
- [ ] 填写真实可执行的验证命令

### 禁止启动条件

- `project-context.md` 为空
- 验证命令仍为占位符
- `docs/backlog/` 为空
- 需求模糊到需要猜测用户可见行为

---

## 目录结构

```
├── AGENTS.md                     # AI 角色行为契约
├── docs/
│   ├── index.md                  # 文档路由表
│   ├── context/                  # AI 必读上下文
│   ├── architecture/             # 技术架构
│   ├── design/                   # 应用层设计
│   ├── process/                  # 开发流程
│   ├── backlog/                  # 工作队列
│   ├── requirements/             # 需求
│   ├── skills/                   # 可复用技能
│   ├── standards/                # 工程规范
│   ├── plans/                    # 执行计划
│   ├── logs/                     # 开发日志
│   ├── bugs/                     # Bug 记录
│   ├── audits/                   # 审计记录
│   ├── input/                    # 原始输入
│   └── discussions/              # 讨论记录
└── templates/                    # 文档模板
```

---

## 核心原则

1. **文件进，文件出** — 重要结论必须落地到仓库文件
2. **吸引子 = 稳定结构** — 由 `context/`、`requirements/`、`design/`、`architecture/` 承载
3. **设计分离** — 业务设计 vs 技术架构分开写
4. **最小完整切片** — 一个真实功能 > 五个空壳页面
5. **独立审查** — 高风险变更用独立子 Agent 审查

---

## 开发工作流

10 阶段工作流：读取上下文 → 收集输入 → 澄清歧义 → 合成需求 → 更新设计 → 审计文档 → 编写计划 → 审计计划 → 实现切片 → 验证 → 闭包审计

详见 `docs/process/workflow.md`

---

## 包含的技能

| 技能 | 用途 |
|------|------|
| `age-init` | 一键初始化 AGE 模板项目 |
| `ddd` | DDD 领域驱动设计架构规范 |
| `tdd` | TDD 测试驱动开发框架 |
| `frontend-design` | 前端视觉设计指南 |
| `browser-use` | 浏览器自动化测试 |
| `grill-with-docs` | 文档审查与质疑 |
| `vercel-react-best-practices` | React/Next.js 性能优化 |
| `to-prd` | 对话转 PRD |
| `diagnosing-bugs` | 结构化 Bug 诊断（复现→假设→修复） |
| `code-review` | 双轴代码审查（规范 + 需求） |
| `codebase-design` | 深度模块设计语言 |
| `handoff` | 会话间上下文交接 |
| `research` | 技术调研（带来源引用） |

---

## 包含的规范

| 规范 | 内容 |
|------|------|
| `security` | 加密/脱敏/密钥管理规范 |
| `logging` | 日志格式/轮转/脱敏规范 |
| `changelog` | CHANGELOG 格式和管理规则 |
| `testing` | TDD 测试策略和覆盖率标准 |
| `error-handling` | 跨语言错误处理规范 |
| `harness` | 驾驭工程：渐进式构建 Agent 友好项目 |

---

## 参考

- [从 Spec-Driven Development 到 Attractor-Guided Engineering](https://mp.weixin.qq.com/s?__biz=MzkyNTU1NTQyNw==&mid=2247486424&idx=1&sn=9a95b0affb9a6fea427b58c57888fba8&scene=21#wechat_redirect)
- [Attractor Before Harness: AI 大规模开发的方法论](https://mp.weixin.qq.com/s?__biz=MzkyNTU1NTQyNw==&mid=2247486438&idx=1&sn=05a9cc91354e7fe6a57b0361a0f23a70&scene=21#wechat_redirect)
- [AGE 模板 GitHub](https://github.com/entropy-cloud/attractor-guided-engineering-template)