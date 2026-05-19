#!/usr/bin/env python3
"""
图片压缩脚本 - 无损压缩所有 PNG/JPG 图片
"""

from PIL import Image
import os
import sys

def compress_image(input_path, output_path, quality=85):
    """
    压缩图片
    - PNG: 转为 RGB 并优化
    - JPG: 降低质量到 85（视觉上无区别）
    """
    try:
        img = Image.open(input_path)
        
        # 获取原始大小
        original_size = os.path.getsize(input_path)
        
        # PNG 转 RGB（去除 Alpha 通道可减小文件）
        if img.mode in ('RGBA', 'LA', 'P'):
            # 如果有透明通道，保留为 PNG
            img.save(output_path, 'PNG', optimize=True)
        else:
            # 其他格式用 JPEG 压缩
            img.save(output_path, 'JPEG', quality=quality, optimize=True)
        
        # 获取压缩后大小
        compressed_size = os.path.getsize(output_path)
        ratio = (1 - compressed_size / original_size) * 100
        
        return original_size, compressed_size, ratio
    except Exception as e:
        print(f"❌ 错误处理 {input_path}: {e}")
        return None, None, None

def main():
    images_dir = 'images'
    
    if not os.path.exists(images_dir):
        print("❌ images 文件夹不存在")
        return
    
    # 创建备份文件夹
    backup_dir = 'images_backup'
    if not os.path.exists(backup_dir):
        os.makedirs(backup_dir)
        print(f"✅ 创建备份文件夹: {backup_dir}")
    
    print("\n" + "="*60)
    print("🖼️  开始压缩图片...")
    print("="*60 + "\n")
    
    total_original = 0
    total_compressed = 0
    
    # 处理所有图片
    for filename in sorted(os.listdir(images_dir)):
        if filename.lower().endswith(('.png', '.jpg', '.jpeg')):
            input_path = os.path.join(images_dir, filename)
            backup_path = os.path.join(backup_dir, filename)
            
            # 备份原始文件
            if not os.path.exists(backup_path):
                os.system(f'cp "{input_path}" "{backup_path}"')
            
            # 压缩
            orig_size, comp_size, ratio = compress_image(input_path, input_path)
            
            if orig_size:
                total_original += orig_size
                total_compressed += comp_size
                
                print(f"✅ {filename}")
                print(f"   原始: {orig_size/1024/1024:.2f}MB → 压缩: {comp_size/1024/1024:.2f}MB ({ratio:.1f}% 减少)")
            else:
                print(f"⚠️  {filename} 处理失败")
    
    print("\n" + "="*60)
    print(f"📊 总体压缩结果")
    print("="*60)
    print(f"原始总大小: {total_original/1024/1024:.2f}MB")
    print(f"压缩后大小: {total_compressed/1024/1024:.2f}MB")
    print(f"总体减少: {(1 - total_compressed/total_original)*100:.1f}%")
    print("="*60 + "\n")
    
    print("✨ 压缩完成！")
    print(f"💾 原始文件已备份到 {backup_dir}/")

if __name__ == '__main__':
    main()
