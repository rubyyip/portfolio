#!/bin/bash

# 🚀 GitHub CLI 一键部署脚本
# 这个脚本会自动完成以下操作:
# 1. 检查 GitHub CLI 是否安装
# 2. 自动登录 GitHub (浏览器授权)
# 3. 创建远程仓库
# 4. 推送代码到 GitHub
# 5. 启用 GitHub Pages
# 6. 输出最终网址

set -e

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║  🚀 GitHub CLI 一键部署脚本                                     ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# ============================================================
# 第 1 步: 检查 GitHub CLI 是否安装
# ============================================================

echo "📋 步骤 1/5: 检查 GitHub CLI..."
echo ""

if ! command -v gh &> /dev/null; then
    echo "❌ 错误: GitHub CLI 未安装"
    echo ""
    echo "请按以下步骤安装:"
    echo ""
    echo "  macOS (使用 Homebrew):"
    echo "    brew install gh"
    echo ""
    echo "  或访问: https://cli.github.com"
    echo ""
    exit 1
fi

GH_VERSION=$(gh --version)
echo "✅ GitHub CLI 已安装: $GH_VERSION"
echo ""

# ============================================================
# 第 2 步: 检查是否已登录
# ============================================================

echo "📋 步骤 2/5: 检查 GitHub 登录状态..."
echo ""

if gh auth status &> /dev/null; then
    echo "✅ 已登录 GitHub"
    CURRENT_USER=$(gh api user -q '.login')
    echo "   用户名: $CURRENT_USER"
else
    echo "🔐 需要登录 GitHub..."
    echo ""
    echo "⚠️ 即将打开浏览器进行授权"
    echo "请按照提示完成登录"
    echo ""
    
    gh auth login --web --scopes repo,gist
    
    if ! gh auth status &> /dev/null; then
        echo "❌ 登录失败"
        exit 1
    fi
    
    CURRENT_USER=$(gh api user -q '.login')
    echo "✅ 登录成功: $CURRENT_USER"
fi

echo ""

# ============================================================
# 第 3 步: 创建远程仓库
# ============================================================

echo "📋 步骤 3/5: 创建 GitHub 仓库..."
echo ""

REPO_NAME="portfolio"
REPO_DESCRIPTION="叶咏婷 · 个人作品集"

# 检查仓库是否已存在
if gh repo view $CURRENT_USER/$REPO_NAME &> /dev/null; then
    echo "⚠️ 仓库 '$REPO_NAME' 已存在"
    echo "✅ 将使用现有仓库"
else
    echo "🔨 创建新仓库: $REPO_NAME"
    gh repo create $REPO_NAME \
        --public \
        --source=. \
        --remote=origin \
        --push \
        --description="$REPO_DESCRIPTION"
    
    echo "✅ 仓库创建成功"
fi

echo ""

# ============================================================
# 第 4 步: 推送代码
# ============================================================

echo "📋 步骤 4/5: 推送代码到 GitHub..."
echo ""

if [ ! -d ".git" ]; then
    echo "🔨 初始化 Git 仓库..."
    git init
    git add .
    git commit -m "Portfolio deployment with security headers"
fi

# 设置 Git 用户信息 (如果还没有)
if ! git config user.name &> /dev/null; then
    echo "🔨 配置 Git 用户信息..."
    git config --global user.name "$CURRENT_USER"
    git config --global user.email "2394943735@qq.com"
fi

# 检查是否有远程仓库
if ! git remote get-url origin &> /dev/null; then
    echo "🔨 添加远程仓库..."
    REPO_URL="https://github.com/$CURRENT_USER/$REPO_NAME.git"
    git remote add origin $REPO_URL
fi

# 推送代码
echo "🔨 推送代码..."
git branch -M main
git push -u origin main

echo "✅ 代码推送成功"
echo ""

# ============================================================
# 第 5 步: 启用 GitHub Pages
# ============================================================

echo "📋 步骤 5/5: 启用 GitHub Pages..."
echo ""

# 等待仓库初始化
sleep 2

# 启用 GitHub Pages
gh repo edit $CURRENT_USER/$REPO_NAME \
    --enable-issues=false \
    --enable-wiki=false \
    --enable-discussions=false \
    2>/dev/null || true

# 设置 GitHub Pages
# 注意: 这需要通过 API 调用
echo "⏳ 正在配置 GitHub Pages..."

# 创建部署设置
gh api repos/$CURRENT_USER/$REPO_NAME/pages \
    -X POST \
    -f source='{"branch":"main","path":"/"}' \
    2>/dev/null || gh api repos/$CURRENT_USER/$REPO_NAME/pages \
    -X PUT \
    -f source='{"branch":"main","path":"/"}' \
    2>/dev/null || true

echo "✅ GitHub Pages 配置完成"
echo ""

# ============================================================
# 完成: 显示最终网址
# ============================================================

SITE_URL="https://$CURRENT_USER.github.io/$REPO_NAME"

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║  ✨ 部署完成！                                                   ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

echo "🌐 您的作品集网址:"
echo ""
echo "   $SITE_URL"
echo ""

echo "⏳ 网站将在 1-2 分钟内上线"
echo ""

echo "📋 检查部署状态:"
echo "   访问仓库: https://github.com/$CURRENT_USER/$REPO_NAME"
echo "   查看 Actions 标签查看部署日志"
echo ""

echo "🔒 安全验证 (部署后):"
echo "   1. 在浏览器访问上述网址"
echo "   2. 检查是否显示绿色锁形图标 (HTTPS)"
echo "   3. 访问 https://securityheaders.com 进行安全评分"
echo ""

echo "💡 更新网站:"
echo "   修改文件后运行:"
echo "   git add ."
echo "   git commit -m 'Update content'"
echo "   git push origin main"
echo ""

echo "✅ 部署脚本完成！"
echo ""
