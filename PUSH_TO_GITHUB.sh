#!/bin/bash

# 🚀 手动推送代码到 GitHub
# 这个脚本会帮您推送最新代码并触发重新部署

set -e

echo ""
echo "════════════════════════════════════════════════════════"
echo "  🚀 推送代码到 GitHub - 触发重新部署"
echo "════════════════════════════════════════════════════════"
echo ""

# 检查 Git 状态
echo "📋 检查 Git 状态..."
git status

echo ""
echo "🔧 配置远程仓库..."

# 移除旧的远程仓库（如果存在）
git remote remove origin 2>/dev/null || true

# 添加新的远程仓库
git remote add origin https://github.com/rubyyip/portfolio.git

echo "✅ 远程仓库已配置"
echo ""

# 推送代码
echo "📤 推送代码到 GitHub..."
echo ""
echo "⚠️ 如果弹出登录提示，请按照以下步骤操作:"
echo "   1. 在浏览器中登录 GitHub"
echo "   2. 按照终端提示完成身份验证"
echo "   3. 推送会自动继续"
echo ""

git push -u origin main

echo ""
echo "════════════════════════════════════════════════════════"
echo "  ✅ 推送完成！"
echo "════════════════════════════════════════════════════════"
echo ""
echo "🔄 GitHub Pages 正在重新部署..."
echo "⏳ 通常需要 1-2 分钟"
echo ""
echo "📊 查看部署状态:"
echo "   https://github.com/rubyyip/portfolio/actions"
echo ""
echo "🌐 访问您的网站:"
echo "   https://rubyyip.github.io/portfolio"
echo ""
echo "💡 提示: 部署完成后，用浏览器强制刷新 (Cmd+Shift+R)"
echo ""
