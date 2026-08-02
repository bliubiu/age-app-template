# 浏览器自动化

> 使用 browser-use CLI 进行 Web 测试、表单填写、截图和数据提取。

---

## 前置条件

```bash
browser-use doctor    # 验证安装
```

---

## 核心工作流

1. **导航**：`browser-use open <url>` — 按需启动浏览器
2. **检查**：`browser-use state` — 返回可点击元素及索引
3. **交互**：使用 state 返回的索引（`browser-use click 5`、`browser-use input 3 "text"`）
4. **验证**：`browser-use state` 或 `browser-use screenshot` 确认
5. **重复**：浏览器在命令间保持打开
6. **清理**：`browser-use close` 完成后关闭

---

## 浏览器模式

```bash
browser-use open <url>                         # 默认：无头 Chromium
browser-use --headed open <url>                # 可见窗口
browser-use --profile "Default" open <url>      # 使用真实 Chrome 配置（已有登录态/cookies）
browser-use --connect open <url>               # 自动发现运行中的 Chrome
browser-use --cdp-url ws://localhost:9222/... open <url>  # 通过 CDP URL 连接
```

---

## 常用命令

### 导航
```bash
browser-use open <url>              # 导航到 URL
browser-use back                    # 后退
browser-use scroll down             # 向下滚动（--amount N 像素）
browser-use scroll up               # 向上滚动
```

### 页面状态
```bash
browser-use state                   # URL、标题、可点击元素及索引
browser-use screenshot [path.png]   # 截图（base64 若无路径，--full 全页）
```

### 交互
```bash
browser-use click <index>           # 按索引点击元素
browser-use click <x> <y>           # 按像素坐标点击
browser-use type "text"             # 向聚焦元素键入
browser-use input <index> "text"    # 点击元素后键入
browser-use keys "Enter"            # 发送键盘按键
browser-use select <index> "option" # 选择下拉选项
browser-use upload <index> <path>   # 上传文件
browser-use hover <index>           # 悬停
```

### 数据提取
```bash
browser-use eval "js code"          # 执行 JavaScript
browser-use get title               # 页面标题
browser-use get html [--selector "h1"]  # 页面 HTML
browser-use get text <index>        # 元素文本内容
browser-use get value <index>       # 输入框值
browser-use get attributes <index>  # 元素属性
```

### 等待
```bash
browser-use wait selector "css"     # 等待元素出现
browser-use wait text "text"        # 等待文本出现
```

---

## 命令链

```bash
browser-use open https://example.com && browser-use state
browser-use input 5 "user@example.com" && browser-use input 6 "password" && browser-use click 7
```

---

## 常见工作流

### 认证浏览
```bash
browser-use profile list                           # 查看可用配置
browser-use --profile "Default" open https://github.com  # 已登录
```

### 连接已有 Chrome
```bash
browser-use --connect open https://example.com
```

### 暴露本地开发服务器
```bash
browser-use tunnel 3000                            # → https://abc.trycloudflare.com
browser-use open https://abc.trycloudflare.com
```

---

## 提示

1. **始终先运行 `state`** 查看可用元素和索引
2. **使用 `--headed` 调试** 查看浏览器实际操作
3. **会话持久化** — 浏览器在命令间保持打开
4. **CLI 别名**：`bu`、`browser`、`browseruse` 均可使用

---

## 清理

```bash
browser-use close                         # 关闭浏览器会话
browser-use tunnel stop --all             # 停止所有隧道
```