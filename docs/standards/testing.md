# 测试规范

> 提取自 projInit 通用规范，定义 TDD 测试策略和标准。

---

## TDD（测试驱动开发）

### 核心循环

```
Red（红）  → 先写失败的测试
Green（绿）→ 编写最少代码使测试通过
Refactor（重构）→ 优化代码结构
```

---

## 测试金字塔

```
         /\
        /E2E\        ← 端到端测试（少量）
       /------\
      / 集成测试 \    ← 集成测试（中等）
     /------------\
    /   单元测试    \  ← 单元测试（大量）
   /----------------\
```

---

## 测试覆盖率目标

| 层级         | 覆盖率目标 |
| :----------- | :--------- |
| 核心业务逻辑 | ≥ 90%      |
| 工具函数     | ≥ 80%      |
| UI 组件      | ≥ 70%      |
| 基础设施代码 | ≥ 60%      |

---

## 测试文件组织

### 命名规范

| 语言       | 测试文件命名              |
| :--------- | :------------------------ |
| Go         | `*_test.go`               |
| TypeScript | `*.test.ts` 或 `*.spec.ts` |
| Java       | `*Test.java`              |
| Python     | `test_*.py`               |
| Rust       | `#[cfg(test)]` 模块       |

### 目录结构

- Go 测试：与源代码同目录
- TypeScript 测试：与源代码同目录或 `__tests__` 目录
- 集成测试：`tests/integration/`
- E2E 测试：`tests/e2e/`

---

## 测试工具链

| 语言       | 单元测试 | Mock        | 断言       | 覆盖率         |
| :--------- | :------- | :---------- | :--------- | :------------- |
| TypeScript | Vitest   | vi.mock()   | expect     | v8/istanbul    |
| Java       | JUnit 5  | Mockito     | AssertJ    | JaCoCo         |
| Go         | testing  | gomock      | testify    | go test -cover |
| Python     | pytest   | pytest-mock | assert     | pytest-cov     |
| Rust       | built-in | mockall     | assert_eq! | tarpaulin      |

---

## 测试数据管理

- 使用工厂函数生成测试数据（如 `createMockUser()`）
- 集成测试使用独立的测试数据库
- 测试结束后清理测试数据

---

## 测试用例要求

- 单元测试：100% 覆盖核心业务逻辑，全覆盖边界情况、异常情况
- 集成测试：覆盖组件、API 接口协作验证、数据库适配
- 系统测试（E2E）：完整链路验证

---

## CI/CD 质量门禁

1. 提交前检查：ESLint / Go Vet / Prettier
2. 单元测试：必须全部通过，覆盖率不低于阈值
3. 集成测试：关键流程验证
4. 安全扫描：依赖漏洞检查
5. 构建验证：可成功构建并生成产物