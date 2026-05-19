# 叶咏婷 · 个人作品集

纯静态 HTML 作品集网站，展示零售电商设计作品。

## 📋 项目说明

- **页面数**: 5 个完整项目页面
- **项目列表**:
  1. S1 - 首页/展示
  2. S2 - 个人介绍
  3. S3 - 项目 1：售后体验升级
  4. S4 - 项目 2：售后体验升级（左侧背景色版本）
  5. S5 - 项目 3&4：选购体验 + 门店终端

## 🔒 安全配置

### HTTPS 加密
- ✅ GitHub Pages 自动启用 HTTPS
- 所有流量都会加密传输

### 安全响应头 (_headers)
- `X-Content-Type-Options`: 防止 MIME 类型嗅探
- `X-Frame-Options: DENY`: 防止点击劫持
- `X-XSS-Protection`: 启用浏览器 XSS 保护
- `Content-Security-Policy`: 严格的内容安全策略
- `Referrer-Policy`: 隐私保护

### 资源隔离
- 纯静态文件，无动态代码执行
- 禁用 iframe 嵌入 (`X-Frame-Options: DENY`)
- 内容安全策略限制脚本源

## 🚀 部署步骤

### 1. 创建 GitHub 仓库
```bash
# 初始化 Git 仓库
cd /Users/ting/Downloads/叶咏婷_slides_handoff
git init
git add .
git commit -m "Initial portfolio commit"
```

### 2. 推送到 GitHub
```bash
# 创建远程仓库后，运行以下命令：
git remote add origin https://github.com/YOUR_USERNAME/portfolio.git
git branch -M main
git push -u origin main
```

### 3. 启用 GitHub Pages
- 进入仓库 Settings → Pages
- Source 选择 "main branch"
- 等待部署完成（通常 1-2 分钟）

### 4. 访问网站
- 默认域名: `https://YOUR_USERNAME.github.io/portfolio`
- 自定义域名 (可选): 在 Settings → Pages 中配置 CNAME

## 📁 文件结构

```
.
├── index.html              # 主要入口
├── images/                 # 设计稿图片
│   ├── 售后配图.png
│   ├── 选购优化.png
│   ├── 收银台.png
│   └── ...
├── _headers                # 安全响应头配置
├── .gitignore             # Git 忽略文件
└── README.md              # 本文件
```

## 🔐 安全建议

1. **定期更新** - 保持依赖和内容最新
2. **监控访问日志** - GitHub 提供的访问统计
3. **备份代码** - Git 仓库即为版本控制备份
4. **禁用编辑权限** - 建议设置仓库只读或受保护

## 📞 常见问题

### 为什么选择 GitHub Pages?
- 免费且永久托管
- 自动 HTTPS
- CDN 加速
- 无需维护服务器

### 图片会被压缩吗?
- GitHub Pages 不会压缩图片
- 建议使用 WebP 格式进一步优化（可选）

### 能更新内容吗?
- 是的，修改文件后 `git push` 即可自动部署
- 通常 1-2 分钟内生效

---

**部署时间**: 2024-05-19
**维护者**: 叶咏婷
