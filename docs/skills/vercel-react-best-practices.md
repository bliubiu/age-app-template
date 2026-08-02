# Vercel React 最佳实践

> React 和 Next.js 性能优化指南，来自 Vercel 工程团队。包含 64 条规则，涵盖 8 个类别。编写、审查或重构 React/Next.js 代码时参考。

---

## 规则类别（按优先级）

| 优先级 | 类别 | 影响 | 前缀 |
|--------|------|------|------|
| 1 | 消除瀑布流 | CRITICAL | `async-` |
| 2 | 包体积优化 | CRITICAL | `bundle-` |
| 3 | 服务端性能 | HIGH | `server-` |
| 4 | 客户端数据获取 | MEDIUM-HIGH | `client-` |
| 5 | 重渲染优化 | MEDIUM | `rerender-` |
| 6 | 渲染性能 | MEDIUM | `rendering-` |
| 7 | JavaScript 性能 | LOW-MEDIUM | `js-` |
| 8 | 高级模式 | LOW | `advanced-` |

---

## 1. 消除瀑布流（CRITICAL）

- **推迟 await**：将 await 移到实际使用的分支中
- **并行请求**：对独立操作使用 `Promise.all()`
- **部分依赖**：使用 better-all 处理部分依赖
- **API 路由**：尽早启动 Promise，晚点 await
- **Suspense 边界**：使用 Suspense 流式传输内容

```typescript
// ❌ 串行瀑布流
const user = await fetchUser();
const orders = await fetchOrders(user.id);

// ✅ 并行请求
const [user, orders] = await Promise.all([
  fetchUser(),
  fetchOrders(userId),
]);
```

---

## 2. 包体积优化（CRITICAL）

- **禁止桶导入**：直接导入，避免桶文件
- **动态导入**：对重型组件使用 `next/dynamic`
- **延迟第三方脚本**：在 hydration 后加载分析/日志
- **条件加载**：仅在功能激活时加载模块
- **预加载**：在悬停/聚焦时预加载以提升感知速度

```typescript
// ❌ 桶导入
import { Button } from '@/components';

// ✅ 直接导入
import { Button } from '@/components/Button';
```

---

## 3. 服务端性能（HIGH）

- **认证服务端操作**：像 API 路由一样认证 Server Actions
- **React.cache()**：用于每次请求的去重
- **LRU 缓存**：用于跨请求缓存
- **减少序列化**：最小化传递给客户端组件的数据
- **并行获取**：重构组件以并行化 fetch
- **after()**：用于非阻塞操作

---

## 4. 客户端数据获取（MEDIUM-HIGH）

- **SWR 去重**：使用 SWR 自动去重请求
- **事件监听器去重**：去重全局事件监听器
- **被动事件监听器**：对 scroll 使用被动监听器
- **localStorage 模式**：版本化和最小化 localStorage 数据

---

## 5. 重渲染优化（MEDIUM）

- **推迟读取**：不要订阅仅在回调中使用的状态
- **Memo**：将昂贵的工作提取到 memoized 组件
- **原始依赖**：在 effect 中使用原始依赖
- **派生状态**：订阅派生的布尔值，而非原始值
- **在渲染期间派生状态**：在渲染期间派生状态，而非 effect
- **函数式 setState**：使用函数式 setState 获得稳定回调
- **懒状态初始化**：传递函数给 useState 处理昂贵值
- **拆分组合 hooks**：拆分具有独立依赖的 hooks
- **将 effect 移到事件**：将交互逻辑放在事件处理器中
- **Transitions**：使用 startTransition 处理非紧急更新
- **useDeferredValue**：推迟昂贵渲染以保持输入响应
- **禁止内联组件**：不要在组件内定义组件

```typescript
// ❌ 内联组件（每次渲染重新创建）
function Parent() {
  function Child() { return <div>child</div>; }
  return <Child />;
}

// ✅ 独立定义
function Child() { return <div>child</div>; }
function Parent() { return <Child />; }
```

---

## 6. 渲染性能（MEDIUM）

- **动画 SVG 包裹器**：动画 div 包裹器，而非 SVG 元素
- **content-visibility**：对长列表使用 content-visibility
- **提升 JSX**：在组件外提取静态 JSX
- **SVG 精度**：减少 SVG 坐标精度
- **hydration 无闪烁**：对仅客户端数据使用内联脚本
- **条件渲染**：使用三元运算符，而非 `&&`
- **资源提示**：使用 React DOM 资源提示进行预加载

---

## 7. JavaScript 性能（LOW-MEDIUM）

- **批量 DOM CSS**：通过类或 cssText 分组 CSS 更改
- **索引 Map**：为重复查找构建 Map
- **缓存属性访问**：在循环中缓存对象属性
- **缓存函数结果**：在模块级 Map 中缓存函数结果
- **合并迭代**：将多个 filter/map 合并为一个循环
- **先检查长度**：在昂贵比较前检查数组长度
- **提前返回**：从函数中提前返回
- **提升正则**：在循环外创建 RegExp
- **Set/Map 查找**：使用 Set/Map 进行 O(1) 查找
- **toSorted()**：使用 toSorted() 实现不可变性

---

## 8. 高级模式（LOW）

- **事件处理器 refs**：将事件处理器存储在 refs 中
- **初始化一次**：每个应用加载周期初始化一次
- **useLatest**：使用 useLatest 获得稳定的回调 refs