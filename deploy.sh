#!/bin/bash

# 🚀 GitHub Pages 自动部署脚本
# 使用方法: bash deploy.sh

set -e

echo "================================"
echo "📦 叶咏婷 Portfolio 部署脚本"
echo "================================"
echo ""

# 检查 Git 是否已安装
if ! command -v git &> /dev/null; then
    echo "❌ 错误: Git 未安装"
    echo "请先安装 Git: https://git-scm.com/downloads"
    exit 1
fi

# 检查是否在正确的目录
if [ ! -f "index.html" ]; then
    echo "❌ 错误: 找不到 index.html"
    echo "请在项目根目录运行此脚本"
    exit 1
fi

echo "✅ 前置检查通过"
echo ""

# 初始化 Git 仓库 (如果还没有)
if [ ! -d ".git" ]; then
    echo "🔧 初始化 Git 仓库..."
    git init
    git add .
    git commit -m "Initial portfolio commit"
    echo "✅ Git 仓库已初始化"
else
    echo "✅ Git 仓库已存在"
fi

echo ""
echo "================================"
echo "📋 下一步操作"
echo "================================"
echo ""
echo "1️⃣ 在 GitHub 上创建新仓库"
echo "   访问: https://github.com/new"
echo "   仓库名: portfolio (或其他名称)"
echo "   选择: Public (公开)"
echo "   不要初始化 README"
echo ""
echo "2️⃣ 复制以下命令并在终端运行:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/portfolio.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "   ⚠️ 注意: 将 YOUR_USERNAME 替换为您的 GitHub 用户名"
echo ""
echo "3️⃣ 启用 GitHub Pages"
echo "   进入: https://github.com/YOUR_USERNAME/portfolio/settings/pages"
echo "   Source: Deploy from a branch"
echo "   Branch: main"
echo "   Folder: / (root)"
echo "   点击 Save"
echo ""
echo "4️⃣ 等待部署完成"
echo "   通常需要 1-2 分钟"
echo "   访问: https://YOUR_USERNAME.github.io/portfolio"
echo ""
echo "================================"
echo "🔐 安全验证"
echo "================================"
echo ""
echo "部署后，请验证以下安全措施:"
echo ""
echo "✓ HTTPS 已启用"
echo "  curl -I https://YOUR_USERNAME.github.io/portfolio/"
echo ""
echo "✓ 安全响应头已配置"
echo "  curl -I https://YOUR_USERNAME.github.io/portfolio/ | grep -E 'X-|Content-Security'"
echo ""
echo "✓ 在线安全评分"
echo "  https://securityheaders.com"
echo ""

echo "✨ 部署脚本完成！"
echo ""
