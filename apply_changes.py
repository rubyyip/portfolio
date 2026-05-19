#!/usr/bin/env python3

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. 修改 AI 助手项目的 div，添加 id
old_ai = '<div class="proj-challenge">\n        <div class="proj-challenge-item">\n          <strong>1）AI 助手对业务是全新能力'
new_ai = '<div class="proj-challenge" id="ai-helper-challenge">\n        <div class="proj-challenge-item">\n          <strong>1）AI 助手对业务是全新能力'

if old_ai in content:
    content = content.replace(old_ai, new_ai)
    print("✅ 已为 AI 助手项目添加 id")
else:
    print("⚠️ AI 助手项目 ID 可能已存在")

# 2. 修改 CSS，恢复正文默认为 9px，AI 项目单独 11px
old_css_section = '''.proj-challenge-body {
  display: block;
  margin-top: 0.15em;
  padding-left: 1.6em;
  font-size: 11px;
  line-height: 1.72;
  color: #666;
}
.proj-challenge-item:last-child { border-bottom: none; }'''

new_css_section = '''.proj-challenge-body {
  display: block;
  margin-top: 0.15em;
  padding-left: 1.6em;
  font-size: 9px;
  line-height: 1.72;
  color: #666;
}
/* AI 助手项目的正文字体单独设为 11px */
#ai-helper-challenge .proj-challenge-body {
  font-size: 11px;
}
.proj-challenge-item:last-child { border-bottom: none; }'''

if old_css_section in content:
    content = content.replace(old_css_section, new_css_section)
    print("✅ 已修改 CSS：AI 助手 11px，其他项目 9px")
else:
    print("⚠️ CSS 部分可能已修改")

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ 文件已保存")
