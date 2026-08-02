# 设计系统（Design Tokens）

> 项目级设计 Token 规范，定义色彩、字体、间距、圆角、阴影、组件等基础设计语言。基于 Vercel 设计语言提炼，适配通用项目场景。

---

## 快速开始

新项目使用设计 Token 分三步：

1. **选调色板**：从下方色彩表中选定主色、语义色，其余保留默认
2. **选字体栈**：替换 `Geist` 为项目实际字体，其余层级继承
3. **按需裁减组件**：只保留项目实际用到的组件 Token，其余注释掉

所有 Token 值均可通过 CSS 变量或 Tailwind 配置直接引用。

---

## 色彩

### 品牌色

| Token | 值 | 用途 |
|-------|-----|------|
| `primary` | `#171717` | 主 CTA 按钮、深色区域背景 |
| `on-primary` | `#ffffff` | 主色上的文字 |

### 表面色

| Token | 值 | 用途 |
|-------|-----|------|
| `canvas` | `#ffffff` | 卡片、对话框、模态框表面 |
| `canvas-soft` | `#fafafa` | 默认页面背景（98% 白） |
| `canvas-soft-2` | `#f5f5f5` | 更深的内嵌区域、hover 态 |

### 文字色

| Token | 值 | 用途 |
|-------|-----|------|
| `ink` | `#171717` | 标题和正文（浅色表面） |
| `body` | `#4d4d4d` | 次要文字、导航链接、页脚 |
| `mute` | `#888888` | 最低优先级文字、占位符 |

### 分割线

| Token | 值 | 用途 |
|-------|-----|------|
| `hairline` | `#ebebeb` | 1px 分割线、表格行、卡片边框 |
| `hairline-strong` | `#a1a1a1` | 较深的分割线、弱化文字 |

### 链接色

| Token | 值 | 用途 |
|-------|-----|------|
| `link` | `#0070f3` | 主链接色 |
| `link-deep` | `#0761d1` | 按下/访问态链接 |
| `link-bg-soft` | `#d3e5ff` | 链接背景/信息徽章 |

### 语义色

| Token | 值 | 用途 |
|-------|-----|------|
| `success` | `#0070f3` | 成功状态 |
| `error` | `#ee0000` | 错误/危险操作 |
| `error-soft` | `#f7d4d6` | 错误状态背景 |
| `error-deep` | `#c50000` | 错误按下态 |
| `warning` | `#f5a623` | 警告/待处理 |
| `warning-soft` | `#ffefcf` | 警告状态背景 |
| `warning-deep` | `#ab570a` | 警告按下态 |

### 扩展色（可选）

| Token | 值 | 用途 |
|-------|-----|------|
| `violet` | `#7928ca` | 紫色高亮 |
| `violet-soft` | `#d8ccf1` | 紫色浅背景 |
| `cyan` | `#50e3c2` | 青色高亮 |
| `cyan-soft` | `#aaffec` | 青色浅背景 |
| `highlight-pink` | `#ff0080` | 粉红强调 |
| `highlight-magenta` | `#eb367f` | 品红强调 |

### 渐变色（可选，用于 Hero 区域）

| Token | 起 → 止 | 用途 |
|-------|---------|------|
| `gradient-develop` | `#007cf0` → `#00dfd8` | 蓝到青，表示"开发/部署" |
| `gradient-preview` | `#7928ca` → `#ff0080` | 紫到粉，表示"预览" |
| `gradient-ship` | `#ff4d4d` → `#f9cb28` | 珊瑚到琥珀，表示"发布" |

> **原则**：渐变仅在 Hero 级别使用，不缩小到图标或单一颜色。三组渐变可合并为多色网格渐变。

---

## 字体

### 字体栈

```
字体家族：
  无衬线：Geist → Inter → system-ui → -apple-system → sans-serif
  等宽：  Geist Mono → JetBrains Mono → ui-monospace → monospace

字重范围：
  无衬线：400 / 500 / 600（不使用 700+）
  等宽：  400（仅 12-13px）
```

### 字体层级

| Token | 大小 | 字重 | 行高 | 字间距 | 用途 |
|-------|------|------|------|--------|------|
| `display-xl` | 48px | 600 | 48px | -2.4px | Hero 主标题 |
| `display-lg` | 32px | 600 | 40px | -1.28px | 段落标题 |
| `display-md` | 24px | 600 | 32px | -0.96px | 卡片簇标题 |
| `display-sm` | 20px | 600 | 28px | -0.6px | 内联小标题 |
| `body-lg` | 18px | 400 | 28px | 0 | 段落引导文字 |
| `body-md` | 16px | 400 | 24px | 0 | 默认正文 |
| `body-md-strong` | 16px | 500 | 24px | 0 | 加粗正文 |
| `body-sm` | 14px | 400 | 20px | -0.28px | 次要正文、导航文字 |
| `body-sm-strong` | 14px | 500 | 20px | -0.28px | 导航 CTA 标签 |
| `caption` | 12px | 400 | 16px | 0 | 页脚、徽章 |
| `caption-mono` | 12px | 400 | 16px | 0 | 段落标签（等宽） |
| `code` | 13px | 400 | 20px | 0 | 内联代码、终端 |
| `button-md` | 14px | 500 | 20px | 0 | 小按钮标签 |
| `button-lg` | 16px | 500 | 24px | 0 | 营销按钮标签 |

### 字体原则

- **负字间距是品牌声音**：display 级使用 `-2.4` 到 `-0.6` px，不可还原为默认
- **标题首字母大写 + 句号结尾**：如 "Build and deploy on the AI Cloud."
- **等宽字体仅用于技术层**：段落标签、代码块、终端模拟，正文绝不使用等宽
- **字重上限 600**：无衬线字体不使用 700/800
- **等宽字体不用于正文**：等宽仅用于代码和技术标签

### 开源字体替代

| 专有字体 | 开源替代 | 说明 |
|---------|---------|------|
| Geist | **Inter**（400/500/600） | 启用 `ss01`、`ss02` 几何变体 |
| Geist | Satoshi | 次选 |
| Geist Mono | **JetBrains Mono**（400） | 12-13px 匹配技术感 |
| Geist Mono | IBM Plex Mono | 次选 |

---

## 间距

基础单位：**4px**。所有间距值为 4 的倍数。

| Token | 值 | 用途 |
|-------|-----|------|
| `xxs` | 4px | 最小间距 |
| `xs` | 8px | 导航 CTA 内边距、标题段落间距 |
| `sm` | 12px | 按钮行间距、主要 CTA 内边距 |
| `md` | 16px | 模板卡片内边距、移动端边距 |
| `lg` | 24px | 卡片内边距、桌面端边距 |
| `xl` | 32px | 大卡片内边距、定价卡内边距 |
| `2xl` | 40px | 段落间距 |
| `3xl` | 48px | 大段落间距 |
| `4xl` | 64px | 段落上下间距 |
| `5xl` | 96px | 展示段落间距 |
| `6xl` | 128px | 最大间距 |
| `section` | 192px | Hero 段落间距 |

### 间距原则

- 段落上下间距：`4xl` 到 `5xl`，给渐变背景留呼吸空间
- 卡片内部间距：营销卡片 `lg` 到 `xl`，模板网格 `md`
- 内联间距：按钮行、标签行 `sm` 到 `md`
- 整体节奏：**大间隙 + 紧内部**，而非反过来

---

## 圆角

| Token | 值 | 用途 |
|-------|-----|------|
| `none` | 0px | 全宽 Hero/页脚 |
| `xs` | 4px | 最紧凑的内联 pill |
| `sm` | 6px | 基础 UI 圆角（按钮、输入框、下拉） |
| `md` | 8px | 营销卡片圆角 |
| `lg` | 12px | 较大卡片（定价卡） |
| `xl` | 16px | 最大卡片（含 Hero 图的卡片） |
| `pill-sm` | 64px | 标签页 pill |
| `pill` | 100px | 营销 CTA pill |
| `full` | 9999px | 圆形图标按钮 |

### 圆角原则

- 营销 CTA 用 `pill`（100px），导航按钮用 `sm`（6px），两种尺度共存
- 同一屏幕上不要混用 100px pill 和 6px 圆角 — 选一个尺度并保持一致

---

## 阴影与层级

阴影采用**堆叠式**（多个小偏移叠加），而非单层大模糊阴影。每层都附带内嵌 1px 边框线。

| 层级 | 阴影值 | 用途 |
|------|--------|------|
| Level 0 — 平面 | 无阴影、无边框 | 全宽 Hero、深色区域 |
| Level 1 — 内嵌边框 | `inset 0 0 0 1px rgba(0,0,0,0.08)` | 默认卡片（可见边界的卡片） |
| Level 2 — 微浮 | `0 1px 1px rgba(0,0,0,0.02), 0 2px 2px rgba(0,0,0,0.04)` + 内嵌边框 | 模板网格、营销卡片 |
| Level 3 — 软堆叠 | `0 2px 2px rgba(0,0,0,0.04), 0 8px 8px -8px rgba(0,0,0,0.04)` + 内嵌边框 | 功能网格卡片 |
| Level 4 — 浮堆叠 | `0 2px 2px rgba(0,0,0,0.04), 0 8px 16px -4px rgba(0,0,0,0.04)` + 内嵌边框 | 定价卡、突出面板 |
| Level 5 — 模态 | `0 1px 1px rgba(0,0,0,0.02), 0 8px 16px -4px rgba(0,0,0,0.04), 0 24px 32px -8px rgba(0,0,0,0.06)` + 内嵌边框 | 模态框、下拉菜单 |

### 阴影原则

- 始终使用**堆叠阴影**（多个小偏移），禁止单层大模糊
- 始终添加**内嵌 1px 边框**保持卡片边缘清晰
- 深色区域（`primary` 表面）是天然的深度提示，无需额外阴影

---

## 组件 Token

以下组件 Token 可直接映射到 CSS 变量或 Tailwind 类。

### 按钮

| 组件 | 背景 | 文字 | 字体 | 圆角 | 内边距 |
|------|------|------|------|------|--------|
| `button-primary` | `primary` | `on-primary` | `button-lg` | `pill` | `0 sm` |
| `button-secondary` | `canvas` | `ink` | `button-lg` | `pill` | `0 sm` |
| `button-primary-sm` | `primary` | `on-primary` | `button-md` | `pill` | `0 xs` |
| `button-secondary-sm` | `canvas` | `ink` | `button-md` | `pill` | `0 xs` |
| `tab-ghost` | `canvas` | `ink` | `body-sm` | `pill-sm` | `0 md` |
| `icon-button-circular` | `canvas` | `ink` | - | `full` | - |

### 导航

| 组件 | 背景 | 文字 | 字体 | 高度 |
|------|------|------|------|------|
| `nav-bar` | `canvas` | `ink` | `body-sm` | 64px |
| `nav-link` | `canvas` | `body` | `body-sm` | - |
| `nav-cta-signup` | `primary` | `on-primary` | `body-sm-strong` | 28px |
| `nav-cta-login` | `canvas` | `ink` | `body-sm-strong` | 28px |
| `footer` | `canvas` | `body` | `body-sm` | - |

### 卡片

| 组件 | 背景 | 文字 | 圆角 | 内边距 | 阴影 |
|------|------|------|------|--------|------|
| `card-marketing` | `canvas` | `ink` | `md` | `lg` | Level 3 |
| `card-marketing-large` | `canvas` | `ink` | `lg` | `xl` | Level 4 |
| `card-soft` | `canvas-soft` | `ink` | `md` | `lg` | - |
| `template-card` | `canvas` | `ink` | `md` | `md` | Level 2 |
| `pricing-card` | `canvas` | `ink` | `lg` | `xl` | Level 4 |
| `pricing-card-featured` | `primary` | `on-primary` | `lg` | `xl` | Level 4 |
| `code-editor-mockup` | `primary` | `on-primary` | `md` | `lg` | - |

### 表单

| 组件 | 背景 | 文字 | 字体 | 边框 | 圆角 | 高度 |
|------|------|------|------|------|------|------|
| `form-input` | `canvas` | `ink` | `body-sm` | `hairline` | `sm` | 40px |
| `form-input-sm` | `canvas` | `ink` | `body-sm` | `hairline` | `sm` | 32px |
| `form-input-lg` | `canvas` | `ink` | `body-md` | `hairline` | `sm` | 48px |

### 其他

| 组件 | 背景 | 文字 | 字体 | 圆角 | 用途 |
|------|------|------|------|------|------|
| `badge-secondary` | `canvas-soft` | `body` | `caption` | `full` | 元数据标签 |
| `banner-marketing` | `canvas-soft` | `body` | `body-sm` | `full` | 公告 pill |
| `link-inline` | - | `link` | `body-md` | - | 正文内链接 |
| `hero-band` | `canvas` | `ink` | `display-xl` | `none` | Hero 区域 |
| `showcase-band-light` | `canvas-soft` | `ink` | `display-lg` | `none` | 浅色展示区 |
| `showcase-band-dark` | `primary` | `on-primary` | `display-lg` | `none` | 深色展示区 |

---

## 响应式

### 断点

| 断点 | 宽度 | 关键变化 |
|------|------|---------|
| 移动端 | < 600px | Hero 堆叠；3 列 → 1 列；标签页横向滚动 |
| 平板 | 600-959px | 3 列 → 2 列 |
| 桌面 | 960-1199px | 完整 3 列网格 |
| 宽屏 | 1200-1399px | 容器最大 1400px |
| 超宽屏 | ≥ 1400px | 内容居中 1400px；背景色延伸到边缘 |

### 触摸目标

- 营销 CTA 按钮：≥ 48px 高
- 移动端导航按钮：通过 `xs` 内边距增至 44×44px

### 折叠策略

- 导航：桌面端完整链接行，移动端汉堡菜单全屏覆盖
- 网格：3 列 → 2 列 → 1 列
- 定价卡：桌面端 3 列，移动端垂直堆叠，`featured` 始终居中
- 模板网格：5 列 → 3 列 → 2 列 → 1 列

---

## 设计约束（Do's & Don'ts）

### ✅ 必须做

- 主 CTA 统一使用 `primary`（`#171717`），深色墨水即转化目标
- 营销 CTA 用 `pill`（100px），导航按钮用 `sm`（6px），两种尺度明确共存
- 标题使用 `display-*` 字重 600，首字母大写，句号结尾，保持负字间距
- 使用堆叠阴影（多小偏移 + 内嵌边框），而非单层大阴影
- 页面表面循环：`canvas-soft` → `canvas` → `primary`（深色区域即深度提示）
- 代码块和技术标签使用等宽字体

### ❌ 禁止做

- 禁止引入第六种强调色（品牌色 = 墨水 + 灰色 + 四组渐变）
- 禁止标题全大写（首字母大写 + 负字间距不可妥协）
- 禁止单层大阴影（品牌阴影为堆叠式）
- 禁止将渐变缩小到图标尺寸或单一颜色（渐变仅用于 Hero 级别）
- 禁止无衬线字体使用字重 700+
- 禁止同一屏幕混用 100px pill 和 6px 圆角
- 禁止正文使用等宽字体

---

## 技术实现

### CSS 变量

```css
:root {
  /* 色彩 */
  --color-primary: #171717;
  --color-on-primary: #ffffff;
  --color-canvas: #ffffff;
  --color-canvas-soft: #fafafa;
  --color-canvas-soft-2: #f5f5f5;
  --color-ink: #171717;
  --color-body: #4d4d4d;
  --color-mute: #888888;
  --color-hairline: #ebebeb;
  --color-link: #0070f3;
  --color-error: #ee0000;
  --color-warning: #f5a623;

  /* 字体 */
  --font-sans: "Geist", "Inter", system-ui, -apple-system, sans-serif;
  --font-mono: "Geist Mono", "JetBrains Mono", ui-monospace, monospace;

  /* 间距 */
  --space-xs: 8px;
  --space-sm: 12px;
  --space-md: 16px;
  --space-lg: 24px;
  --space-xl: 32px;
  --space-2xl: 40px;
  --space-4xl: 64px;

  /* 圆角 */
  --radius-sm: 6px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-pill: 100px;
  --radius-full: 9999px;

  /* 阴影 */
  --shadow-card: 0 1px 1px rgba(0,0,0,0.02), 0 2px 2px rgba(0,0,0,0.04), inset 0 0 0 1px rgba(0,0,0,0.08);
  --shadow-modal: 0 1px 1px rgba(0,0,0,0.02), 0 8px 16px -4px rgba(0,0,0,0.04), 0 24px 32px -8px rgba(0,0,0,0.06), inset 0 0 0 1px rgba(0,0,0,0.08);
}
```

### Tailwind 配置

```js
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        primary: '#171717',
        canvas: { DEFAULT: '#ffffff', soft: '#fafafa' },
        ink: '#171717',
        body: '#4d4d4d',
        mute: '#888888',
        hairline: '#ebebeb',
        link: '#0070f3',
        error: '#ee0000',
        warning: '#f5a623',
      },
      fontFamily: {
        sans: ['Geist', 'Inter', 'system-ui', '-apple-system', 'sans-serif'],
        mono: ['Geist Mono', 'JetBrains Mono', 'ui-monospace', 'monospace'],
      },
      borderRadius: {
        sm: '6px',
        md: '8px',
        lg: '12px',
        pill: '100px',
        full: '9999px',
      },
      boxShadow: {
        card: '0 1px 1px rgba(0,0,0,0.02), 0 2px 2px rgba(0,0,0,0.04), inset 0 0 0 1px rgba(0,0,0,0.08)',
        modal: '0 1px 1px rgba(0,0,0,0.02), 0 8px 16px -4px rgba(0,0,0,0.04), 0 24px 32px -8px rgba(0,0,0,0.06), inset 0 0 0 1px rgba(0,0,0,0.08)',
      },
    },
  },
};
```

---

## 参考

- 本规范基于 Vercel 设计语言分析提炼，适配通用项目
- 前端实现指南参见 `docs/skills/frontend-design.md`
- 字体开源替代：Inter（无衬线）、JetBrains Mono（等宽）