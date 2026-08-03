# Standards 目录

本目录包含 AGE 项目的所有标准和规范。这些规范是 AI 和团队成员必须遵循的规则。

## 可用规范

### 开发规范

| 规范 | 文件 | 核心内容 |
|------|------|---------|
| **代码规范** | [../context/conventions.md](../context/conventions.md) | 命名、格式、注释、缩进 |
| **测试规范** | [testing.md](testing.md) | TDD 策略、覆盖率标准、测试质量 |
| **错误处理** | [error-handling.md](error-handling.md) | 跨语言错误处理模式 |

### 安全规范

| 规范 | 文件 | 核心内容 |
|------|------|---------|
| **安全规范** | [security.md](security.md) | 加密策略、脱敏规则、密钥管理 |
| **日志规范** | [logging.md](logging.md) | 日志格式、轮转策略、脱敏要求 |

### 流程规范

| 规范 | 文件 | 核心内容 |
|------|------|---------|
| **CHANGELOG** | [changelog.md](changelog.md) | 变更日志格式和管理规则 |
| **驾驭工程** | [harness.md](harness.md) | 渐进式构建 Agent 友好项目的五步法 |
| **设计系统** | [design-system.md](design-system.md) | 设计 Token 规范（色彩/字体/间距/组件） |

### 上下文规范

| 规范 | 文件 | 核心内容 |
|------|------|---------|
| **自主性边界** | [../context/ai-autonomy-policy.md](../context/ai-autonomy-policy.md) | AI 可自主执行 vs 需人工确认的边界 |
| **真相源优先级** | [../context/source-of-truth.md](../context/source-of-truth.md) | 代码、文档、对话等信息的可信度排序 |

## 使用方式

1. **查阅**：遇到特定场景时，参考对应规范
2. **执行**：AI 编写代码时会自动遵循这些规范
3. **审查**：代码审查时对照规范进行检查
4. **更新**：规范随项目演进更新

## 规范演进

当现有规范需要更新时：

1. **评估影响**：判断变更是否为破坏性变更
2. **更新文档**：修改对应规范文件
3. **通知团队**：通过 CHANGELOG 或邮件通知
4. **迁移代码**：如有必要，更新现有代码以符合新规范