# 代码审查

> 双轴代码审查：规范审查 + 需求审查，使用并行子 Agent 防止交叉污染。

---

## 触发条件

- 功能实现完成，准备提交
- PR 合并前的最终检查
- 架构变更后的全面审查
- 按 `docs/context/ai-autonomy-policy.md` 中标记为"必须审查"的变更类型

---

## 双轴审查模型

使用两个独立子 Agent 并行审查，各自聚焦不同维度，互不干扰：

### 轴一：规范审查（Standards Review）

检查代码是否符合项目的编码规范：

| 检查项 | 参考文档 |
|--------|---------|
| 代码风格和命名规范 | `docs/context/conventions.md` |
| 安全规范（加密/脱敏/密钥管理） | `docs/standards/security.md` |
| 日志规范 | `docs/standards/logging.md` |
| 错误处理规范 | `docs/standards/error-handling.md` |
| 测试规范（覆盖率/测试质量） | `docs/standards/testing.md` |
| 架构约束（模块边界/依赖方向） | `docs/architecture/system-baseline.md` |

### 轴二：需求审查（Spec Review）

检查代码是否忠实实现了需求：

| 检查项 | 参考文档 |
|--------|---------|
| 是否覆盖了所有需求点 | `docs/requirements/` 或关联 Issue |
| 验收标准是否全部满足 | 关联 Issue 的 Acceptance Criteria |
| 边界情况是否处理 | 需求文档中的边界定义 |
| 是否有遗漏的功能 | 需求 vs 实现的 diff |

---

## 审查流程

### 1. 确定审查基线

```bash
# 对比当前分支与目标分支的差异
git diff main...HEAD
```

### 2. 启动并行审查

```
Agent A（规范审查）：
  - 读取 docs/context/conventions.md
  - 读取 docs/standards/ 下的相关规范
  - 逐文件检查变更

Agent B（需求审查）：
  - 读取关联的 Issue/PRD
  - 读取验收标准
  - 逐功能点验证实现
```

### 3. 汇总报告

两份审查报告合并，按严重程度分级：

| 级别 | 说明 | 处理 |
|------|------|------|
| 🔴 阻塞 | 必须修复才能合并 | 立即修复 |
| 🟡 建议 | 应该修复，但不阻塞 | 创建 Issue 跟踪 |
| 🔵 备注 | 信息性评论 | 可忽略 |

---

## 审查报告模板

```markdown
# 代码审查报告

## 审查范围
- 分支：feature/xxx → main
- 变更文件：N 个
- 审查日期：YYYY-MM-DD

## 规范审查结果
### 🔴 阻塞
- [文件:行号] 问题描述

### 🟡 建议
- [文件:行号] 建议描述

## 需求审查结果
### 🔴 阻塞
- 需求点 X 未实现

### 🟡 建议
- 验收标准 Y 覆盖不充分

## 审查结论
- [ ] 通过（无阻塞问题）
- [ ] 有条件通过（有建议，无阻塞）
- [ ] 不通过（有阻塞问题）
```