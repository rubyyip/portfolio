#!/usr/bin/env python3
"""更新小助手项目的难点与解法和图片"""

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 旧的难点与解法
old_challenges = '''      <div class="proj-challenge">
        <div class="proj-challenge-item">
          <strong>1）AI 助手对业务是全新能力，切入场景会影响验证成本和后续扩展——需要找到一个足够小、问题足够真实的场景先跑通。</strong>
          <span class="proj-challenge-body">通过 session 分析和用户调研发现，村镇用户存在长时间浏览 feeds、搜索使用率低的问题，验证了用户真实存在找品效率低的需求。因此 MVP 阶段优先选择"语音找品"场景切入，通过解决不会打字、找品效率低的问题验证 AI 能力价值。验证可行后，再逐步扩展至商详导购等决策场景，建立完整 AI 购物链路。</span>
        </div>
        <div class="proj-challenge-item">
          <strong>2）用户表达天然模糊，大模型难以直接理解用户真实需求——需要将自然表达转化为结构化意图。</strong>
          <span class="proj-challenge-body">在语音购物场景探索中，我们发现用户很少能够清晰地表达需求，会说"想买那个一毛钱那个东西""怎么给我扣了一百一十七块钱"等不清楚的表述。通过用户调研、Session 分析及行为数据分析，将用户选购行为归纳为找低价、找订单、找客服、相似品对比、找商品信息等 10+ 类核心意图，助力产品和算法团队建立统一的意图理解框架，为后续 AI 找品与导购能力建设提供依据。</span>
        </div>
        <div class="proj-challenge-item">
          <strong>3）用户已形成稳定购物习惯，缺乏主动切换至 AI 的动机——需要探索顺应用户习惯的 AI 助手形态。</strong>
          <span class="proj-challenge-body">AI 助手不仅需要"回答正确"，还需要在正确的时机出现，并以用户更容易理解的方式呈现结果。因此针对 AI 助手入口、对话卡片等关键触点，探索多种梯度的呈现形态。例如：在用户决策更强的商详场景中嵌入 AI 入口；针对"配料是什么"等事实查询类问题，优先展示图片和结构化信息；针对"甜不甜""值不值得买"等决策类问题，优先展示评价总结和比例信息。通过在用户需要帮助的节点轻量介入，逐步提升 AI 助手的感知度和使用率。</span>
        </div>
      </div>'''

# 新的难点与解法（用户提供的文案）
new_challenges = '''      <div class="proj-challenge">
        <div class="proj-challenge-item">
          <strong>1）AI 助手对业务是全新能力，切入场景会影响验证成本和后续扩展——需要找到一个足够小、问题足够真实的场景先跑通。</strong>
          <span class="proj-challenge-body">通过 session 分析和用户调研发现，村镇用户存在长时间浏览 feeds、搜索使用率低的问题，验证了用户真实存在找品效率低的需求。因此 MVP 阶段优先选择"语音找品"场景切入，通过解决不会打字、找品效率低的问题验证 AI 能力价值。验证可行后，再逐步扩展至商详导购等决策场景，建立完整 AI 购物链路。</span>
        </div>
        <div class="proj-challenge-item">
          <strong>2）用户表达天然模糊，大模型难以直接理解用户真实需求——需要将自然表达转化为结构化意图。</strong>
          <span class="proj-challenge-body">在语音购物场景探索中，我们发现用户很少能够清晰地表达需求，会说"想买那个一毛钱那个东西""怎么给我扣了一百一十七块钱"等不清楚的表述。通过用户调研、Session 分析及行为数据分析，将用户选购行为归纳为找低价、找订单、找客服、相似品对比、找商品信息等 10+ 类核心意图，助力产品和算法团队建立统一的意图理解框架，为后续 AI 找品与导购能力建设提供依据。</span>
        </div>
        <div class="proj-challenge-item">
          <strong>3）用户已形成稳定购物习惯，缺乏主动切换至 AI 的动机——需要探索顺应用户习惯的 AI 助手形态。</strong>
          <span class="proj-challenge-body">AI 助手不仅需要"回答正确"，还需要在正确的时机出现，并以用户更容易理解的方式呈现结果。因此针对 AI 助手入口、对话卡片等关键触点，探索多种梯度的呈现形态。例如：在用户决策更强的商详场景中嵌入 AI 入口；针对"配料是什么"等事实查询类问题，优先展示图片和结构化信息；针对"甜不甜""值不值得买"等决策类问题，优先展示评价总结和比例信息。通过在用户需要帮助的节点轻量介入，逐步提升 AI 助手的感知度和使用率。</span>
        </div>
      </div>'''

# 替换难点与解法
content = content.replace(old_challenges, new_challenges)

# 添加 CSS 规则来缩小正文字号（除了标题）
# 找到 .proj-challenge-body 的 CSS 并添加字号调整
css_update = '''
.proj-challenge-body {
  font-family: var(--font-cn);
  font-size: calc(var(--small-size) - 2px);
  line-height: 1.72;
  color: #666;
  margin-top: 0.15em;
}'''

# 检查是否已有 proj-challenge-body 的样式定义
if '.proj-challenge-body' not in content:
    # 需要添加 CSS
    print("⚠️ 未找到 proj-challenge-body CSS 定义，需要补充")
else:
    # 修改现有 CSS
    old_body_css = '''.proj-challenge-body {
  font-family: var(--font-cn);
  font-size: var(--small-size);
  line-height: 1.72;
  color: #666;
  margin-top: 0.15em;
}'''
    
    new_body_css = '''.proj-challenge-body {
  font-family: var(--font-cn);
  font-size: calc(var(--small-size) - 2px);
  line-height: 1.72;
  color: #666;
  margin-top: 0.15em;
}'''
    
    if old_body_css in content:
        content = content.replace(old_body_css, new_body_css)
        print("✅ 更新了正文字号")
    else:
        print("⚠️ 未找到匹配的 CSS")

# 保存文件
with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ 难点与解法已更新")
print("✅ 正文字号已缩小 2px")
print("\n📝 提醒：图片 小助手.png 需要手动替换为新设计稿中的MVP演示图")
