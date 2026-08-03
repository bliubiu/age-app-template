# Skills 目录

本目录包含 AGE 项目可用的所有 Skill（技能）。Skill 是可按需加载的工作手册，定义了某类任务应该怎样完成。

## 可用技能

### 开发相关

| 技能 | 文件 | 适用场景 |
|------|------|---------|
| **DDD 领域驱动设计** | [ddd.md](ddd.md) | 新增聚合根、实体、领域服务时 |
| **TDD 测试驱动开发** | [tdd.md](tdd.md) | 编写新功能、修复 Bug 时 |
| **前端设计** | [frontend-design.md](frontend-design.md) | 页面视觉设计、UI 实现时 |
| **React 最佳实践** | [vercel-react-best-practices.md](vercel-react-best-practices.md) | React/Next.js 代码编写、审查时 |
| **浏览器自动化** | [browser-use.md](browser-use.md) | Web 测试、截图、数据提取时 |

### 质量相关

| 技能 | 文件 | 适用场景 |
|------|------|---------|
| **代码审查** | [code-review.md](code-review.md) | PR 合并前的双轴审查 |
| **诊断 Bug** | [diagnosing-bugs.md](diagnosing-bugs.md) | Bug 排查、性能回归定位 |
| **深度模块设计** | [codebase-design.md](codebase-design.md) | 模块重构、架构退化检测 |

### 流程相关

| 技能 | 文件 | 适用场景 |
|------|------|---------|
| **文档审查** | [grill-with-docs.md](grill-with-docs.md) | 审查现有文档质量 |
| **会话交接** | [handoff.md](handoff.md) | 多 Agent 协作、会话切换 |
| **技术调研** | [research.md](research.md) | 技术选型、方案对比 |
| **对话转 PRD** | [to-prd.md](to-prd.md) | 将对话整理为正式 PRD |

### 项目管理

| 技能 | 文件 | 适用场景 |
|------|------|---------|
| **AGE 初始化** | [age-init.md](age-init.md) | 新项目初始化、占位符替换 |

## 使用方式

1. **对 AI 说**："使用 TDD 技能开发 XXX 功能"
2. **AI 自动加载**：读取对应 `docs/skills/` 下的文件，按其中的流程执行
3. **按需加载**：AI 根据任务类型自动选择合适的 Skill

## 创建新 Skill

当团队中出现反复执行的任务时，考虑创建新 Skill：

1. 门槛：相似需求至少出现两次，或成本高、风险大
2. 格式：参照现有 Skill 模板结构
3. 存放：放入 `docs/skills/` 目录
4. 索引：更新本 README 的列表