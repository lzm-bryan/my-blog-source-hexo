#!/usr/bin/env bash
set -e

# 进入 Hexo 项目根目录再执行
cd source/_posts

# 创建子目录
mkdir -p english rap notes

# 移动英语系列
git mv "E2025-8-31-电器.md" english/2025-08-31-电器.md
git mv "English.md" english/English.md

# 移动 RAP 系列
git mv "rap.md" rap/rap.md
git mv "rapper.md" rap/rapper.md

# 其它文章归 notes
git mv "wireguard.md" notes/wireguard.md
git mv "vector.md" notes/vector.md
git mv "排序.md" notes/排序.md
git mv "时间线.md" notes/时间线.md
git mv "浅拷贝和深拷贝.md" notes/浅拷贝和深拷贝.md
git mv "完美的计算机规划.md" notes/完美的计算机规划.md
git mv "这找工作感觉跟考研一样啊！.md" notes/这找工作感觉跟考研一样啊！.md
git mv "第一次网购.md" notes/第一次网购.md
git mv "从零开始的第一篇博客.md" notes/从零开始的第一篇博客.md
git mv "test.md" notes/test.md
git mv "phd-two-years.md" notes/phd-two-years.md
