# CHANGELOG 规范

> 提取自 kubet 项目实践，定义统一的变更日志格式和管理规则。

---

## 版本号规范

### CalVer（日历版本）

- 格式：`YYYY.MM.DD.MICRO`（年.月.日.迭代号）
- 示例：`2026.07.31.01`

### SemVer（语义化版本）

- 格式：`主版本号Major.次版本号Minor.补丁号Patch[-可选标签 alpha|beta|rc]`
- 示例：`1.3.0-alpha`

---

## CHANGELOG 管理规则

- 项目根目录建立 `CHANGELOG.md` 文档
- 根据迭代内容，严格按照 SemVer/CalVer 规则确定新版本号
- 在稳定分支打 Tag，Tag 名称与版本号一致
- Tag 仅允许正式发布时创建，禁止随意打测试 Tag

---

## 格式模板

```markdown
## [版本号] - YYYY-MM-DD

### ⚠️ Breaking Changes  破坏性变更
- 【模块名】变更描述

### ✨ New Features 新增功能
- 【模块名】功能描述 #issue编号

### 🐛 Bug Fixes  问题修复
- 【模块名】修复描述 #issue编号

### 📈 Improvements 性能/体验优化
- 【模块名】优化描述

### 📚 Docs 文档更新
- 更新文档描述

### 🔧 Dependencies 依赖更新
- 依赖更新描述

### 🗑 Deprecated 废弃功能
- 废弃功能描述
```

---

## 示例

```markdown
## [1.3.0] - 2026-07-31

### ⚠️ Breaking Changes  破坏性变更
- 【用户模块】废弃旧版登录接口 /api/v1/login，请迁移至 /api/v2/login

### ✨ New Features 新增功能
- 【权限模块】新增角色批量授权功能 #123

### 🐛 Bug Fixes  问题修复
- 【订单模块】修复极端场景下订单状态同步异常问题 #121

### 📈 Improvements 性能/体验优化
- 【接口服务】优化列表查询性能，响应速度提升40%

### 📚 Docs 文档更新
- 更新权限模块使用文档与接口说明

### 🔧 Dependencies 依赖更新
- 升级 Spring Boot 至 3.2.0

### 🗑 Deprecated 废弃功能
- 废弃旧版报表导出接口，请使用新版
```