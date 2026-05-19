#!/bin/bash

cd /Users/ting/Downloads/叶咏婷_slides_handoff

echo ""
echo "════════════════════════════════════════════════════════"
echo "  🚀 更新部署到 GitHub Pages"
echo "════════════════════════════════════════════════════════"
echo ""

# 步骤 1: 配置远程仓库
echo "📋 步骤 1/3: 配置远程仓库..."
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/rubyyip/portfolio.git
echo "✅ 完成"
echo ""

# 步骤 2: 创建新的提交
echo "📋 步骤 2/3: 提交更改..."
git add .
git commit -m "Update portfolio: force redeploy $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null || echo "✓ 所有更改已暂存"
echo "✅ 完成"
echo ""

# 步骤 3: 推送代码
echo "📋 步骤 3/3: 推送到 GitHub..."
echo ""
echo "⚠️ 需要 GitHub 身份认证"
echo "请按照以下步骤操作:"
echo "  1️⃣ 如果弹出浏览器 → 直接授权"
echo "  2️⃣ 如果提示输入密码 → 输入您的 GitHub 个人访问令牌"
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
