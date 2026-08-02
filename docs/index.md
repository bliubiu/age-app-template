# 文档路由表

> 按任务类型快速定位到对应文档。本文档是 AI 和开发者查找信息的入口。

---

## 按任务类型路由

| 我想做什么？                   | 去哪看？                                              |
| :----------------------------- | :---------------------------------------------------- |
| 初始化 AGE 模板项目             | `docs/skills/age-init.md`                             |
| 了解项目背景和约定             | `docs/context/project-context.md`                     |
| 查看代码风格和命名规范         | `docs/context/conventions.md`                         |
| 了解真相源优先级               | `docs/context/source-of-truth.md`                     |
| 了解 AI 自主性边界             | `docs/context/ai-autonomy-policy.md`                  |
| 查看技术架构                   | `docs/architecture/system-baseline.md`                |
| 查看技术栈选型指南             | `docs/architecture/tech-stack.md`                     |
| 了解项目愿景和范围             | `docs/architecture/project-vision.md`                 |
| 查看应用设计                   | `docs/design/app-overview.md`                         |
| 了解开发流程                   | `docs/process/workflow.md`                            |
| 查看待办工作                   | `docs/backlog/index.md`                               |
| 查看需求范围                   | `docs/requirements/product-scope.md`                  |
| 查看安全规范                   | `docs/standards/security.md`                          |
| 查看日志规范                   | `docs/standards/logging.md`                           |
| 查看 CHANGELOG 规范            | `docs/standards/changelog.md`                         |
| 查看测试规范                   | `docs/standards/testing.md`                           |
| 查看错误处理规范               | `docs/standards/error-handling.md`                    |
| 使用 DDD 领域驱动设计          | `docs/skills/ddd.md`                                  |
| 使用 TDD 测试驱动开发          | `docs/skills/tdd.md`                                  |
| 前端开发规范                   | `docs/skills/frontend-design.md`                      |
| React 最佳实践                 | `docs/skills/vercel-react-best-practices.md`          |
| 浏览器自动化测试               | `docs/skills/browser-use.md`                          |
| 文档审查与质疑                 | `docs/skills/grill-with-docs.md`                      |
| 需求转 PRD                    | `docs/skills/to-prd.md`                               |
| 查看执行计划                   | `docs/plans/`                                         |
| 查看开发日志                   | `docs/logs/`                                          |
| 查看 Bug 记录                  | `docs/bugs/`                                          |
| 查看审计记录                   | `docs/audits/`                                        |
| 查看原始输入                   | `docs/input/`                                         |
| 查看讨论记录                   | `docs/discussions/`                                   |

---

## 真相源优先级

| 问题             | 主真相源           | 补充                           |
| :--------------- | :----------------- | :----------------------------- |
| 应该构建什么？   | docs/requirements/ | docs/input/, docs/discussions/ |
| 当前应用行为？   | docs/design/       | 需求驱动变更                   |
| 当前技术结构？   | docs/architecture/ | 模块边界                       |
| 数据库真相？     | 模型/ORM 文件      | 文档只解释意图                 |
| API 契约？       | Schema 文件        | 可执行定义优先                 |
| 如何执行？       | docs/plans/        | 执行契约                       |
| 实际发生了什么？ | docs/logs/         | 测试/审计                      |

### 冲突解决规则

- 需求与设计不一致 → 先决定是否变更基线，再更新文档
- 代码与文档不一致 → 视为实现漂移或文档过时，不能沉默选择
- 模型文件与文档不一致 → 模型文件优先

---

## 文档命名规则

| 类型           | 命名方式       | 示例                                |
| :------------- | :------------- | :---------------------------------- |
| 稳定 owner-doc | 固定名称       | app-overview.md, system-baseline.md |
| 时效文件       | 带日期前缀     | 2026-05-21-feature-req.md           |
| 日志           | 年/月/日       | docs/logs/2026/05-21.md             |
| 审计           | 日期+类型+主题 | 2026-05-21-doc-audit.md             |