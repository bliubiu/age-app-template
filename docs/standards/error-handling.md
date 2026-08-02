# 错误处理规范

> 提取自 projInit 通用规范，定义跨语言的错误处理标准。

---

## Go 错误处理

- 使用 `errors.New()` 或 `fmt.Errorf()` 创建错误
- 错误信息应包含上下文信息
- 对外暴露的错误类型应定义在公共包中
- 使用 `%w` 包装错误，保留错误链

```go
if err != nil {
    return fmt.Errorf("用户登录失败: %w", err)
}
```

---

## TypeScript 错误处理

- 使用 `try/catch` 处理异步错误
- 定义自定义错误类（如 `class ValidationError extends Error`）
- 前端错误应有用户友好的提示
- 使用类型守卫区分错误类型

```typescript
class ValidationError extends Error {
  constructor(message: string, public field: string) {
    super(message);
    this.name = 'ValidationError';
  }
}
```

---

## Java 错误处理

- 使用自定义异常类（如 `BusinessException`）
- 统一异常处理：`@ControllerAdvice` + `@ExceptionHandler`
- 异常信息应包含业务上下文

---

## Python 错误处理

- 使用自定义异常类继承 `Exception`
- FastAPI 中使用 `HTTPException` 或自定义异常处理器
- 异常信息应包含足够的上下文

---

## Rust 错误处理

- 使用 `Result<T, E>` 类型
- 使用 `thiserror` 定义自定义错误类型
- 使用 `anyhow` 处理应用级错误
- 使用 `?` 操作符传播错误

```rust
#[derive(Debug, thiserror::Error)]
pub enum AppError {
    #[error("数据库错误: {0}")]
    Database(#[from] sqlx::Error),
    #[error("验证错误: {0}")]
    Validation(String),
}
```

---

## 统一错误响应格式

```json
{
  "code": 40001,
  "message": "参数验证失败：用户名不能为空",
  "data": null
}
```

- 错误码必须有对应文档，不能随意自定义
- 错误信息使用中文，便于排查

---

## 日志级别对应

| 错误严重程度 | 日志级别 | 处理方式               |
| :----------- | :------- | :--------------------- |
| 业务校验失败 | WARN     | 返回友好提示           |
| 外部依赖失败 | ERROR    | 记录日志 + 返回通用错误 |
| 数据不一致   | ERROR    | 记录日志 + 告警        |
| 系统不可用   | FATAL    | 记录日志 + 优雅退出    |