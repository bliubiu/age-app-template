#!/usr/bin/env bash
# AGE 模板初始化脚本 (Linux/Mac)
# 用法:
#   交互模式:   ./init.sh
#   命令行参数: ./init.sh -n "my-app" -r "git@github.com:user/my-app.git" -d "我的应用"

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_ROOT="$SCRIPT_DIR"

# ── 颜色 ──
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
NC='\033[0m'

echo -e "${CYAN}╔══════════════════════════════════════════╗"
echo -e "║     AGE 应用开发模板 - 项目初始化         ║"
echo -e "║     Attractor-Guided Engineering         ║"
echo -e "╚══════════════════════════════════════════╝${NC}"

# ── 解析参数 ──
PROJECT_NAME=""
REPO_URL=""
DESCRIPTION=""

while getopts "n:r:d:" opt; do
  case $opt in
    n) PROJECT_NAME="$OPTARG" ;;
    r) REPO_URL="$OPTARG" ;;
    d) DESCRIPTION="$OPTARG" ;;
    *) echo "用法: $0 [-n project-name] [-r repo-url] [-d description]" ; exit 1 ;;
  esac
done

# ── 交互模式 ──
if [ -z "$PROJECT_NAME" ]; then
  echo -e "\n${GREEN}请输入项目信息（直接回车使用默认值）:${NC}\n"
  read -p "  项目名称（英文，如 my-app）: " PROJECT_NAME
  read -p "  仓库地址（如 git@github.com:user/my-app.git）: " REPO_URL
  read -p "  一句话描述: " DESCRIPTION
fi

# ── 默认值 ──
PROJECT_NAME="${PROJECT_NAME:-my-project}"
REPO_URL="${REPO_URL:-}"
DESCRIPTION="${DESCRIPTION:-一个 AGE 驱动的应用项目}"

echo -e "\n${GREEN}[信息] 将使用以下配置:${NC}"
echo "  项目名称: $PROJECT_NAME"
echo "  仓库地址: $REPO_URL"
echo "  项目描述: $DESCRIPTION"

read -p $'\n确认开始初始化? (y/n) ' confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
  echo -e "${RED}已取消。${NC}"
  exit 0
fi

# ── 替换函数 ──
replace_placeholders() {
  local content="$1"
  # 替换结构化占位符
  content="${content//\{\{PROJECT_NAME\}\}/$PROJECT_NAME}"
  content="${content//\{\{REPO_URL\}\}/$REPO_URL}"
  content="${content//\{\{project\}\}/$PROJECT_NAME}"
  # 将所有剩余的 {{...}} 替换为 TODO 标记
  content=$(echo "$content" | sed -E 's/\{\{([^}]+)\}\}/<!-- TODO: \1 -->/g')
  echo "$content"
}

# ── 执行替换 ──
echo -e "\n${YELLOW}[执行] 替换占位符...${NC}"

file_count=0
while IFS= read -r -d '' file; do
  relative_path="${file#$TEMPLATE_ROOT/}"
  original=$(cat "$file")
  replaced=$(replace_placeholders "$original")
  
  if [ "$original" != "$replaced" ]; then
    echo "$replaced" > "$file"
    echo -e "  ${GRAY}✓ $relative_path${NC}"
    ((file_count++))
  fi
done < <(find "$TEMPLATE_ROOT" -type f \( -name "*.md" -o -name "*.json" \) -not -path "*/.git/*" -print0)

echo -e "\n${GREEN}[完成] 共处理 $file_count 个文件${NC}"

# ── 清理模板标记 ──
echo -e "\n${YELLOW}[清理] 移除初始化脚本和配置...${NC}"
for f in "$TEMPLATE_ROOT/init.ps1" "$TEMPLATE_ROOT/init.sh" "$TEMPLATE_ROOT/init.config.json"; do
  if [ -f "$f" ]; then
    rm -f "$f"
    echo -e "  ${GRAY}✓ 已删除 $(basename "$f")${NC}"
  fi
done

# ── Git 初始化 ──
read -p $'\n是否初始化 Git 仓库? (y/n) ' init_git
if [ "$init_git" = "y" ] || [ "$init_git" = "Y" ]; then
  echo -e "${YELLOW}[Git] 初始化仓库...${NC}"
  rm -rf "$TEMPLATE_ROOT/.git"
  git -C "$TEMPLATE_ROOT" init
  git -C "$TEMPLATE_ROOT" add -A
  git -C "$TEMPLATE_ROOT" commit -m "从 AGE 模板初始化: $PROJECT_NAME"
  
  if [ -n "$REPO_URL" ]; then
    read -p "  是否添加远程仓库 origin = $REPO_URL? (y/n) " add_remote
    if [ "$add_remote" = "y" ] || [ "$add_remote" = "Y" ]; then
      git -C "$TEMPLATE_ROOT" remote add origin "$REPO_URL"
      echo -e "  ${GREEN}✓ 已添加远程仓库${NC}"
    fi
  fi
  echo -e "${GREEN}[Git] 完成${NC}"
fi

echo -e "\n${CYAN}╔══════════════════════════════════════════╗"
echo -e "║          初始化完成！                      ║"
echo -e "║                                          ║"
echo -e "║  下一步:                                  ║"
echo -e "║  1. 搜索 <!-- TODO 补充剩余内容            ║"
echo -e "║  2. 填写 docs/backlog/ 第一个工作项        ║"
echo -e "║  3. 填写真实可执行的验证命令               ║"
echo -e "║  4. 开始编码！                             ║"
echo -e "╚══════════════════════════════════════════╝${NC}"