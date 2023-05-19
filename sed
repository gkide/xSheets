---
tags: [ development ]
---
# -e ...  多重编辑，命令顺序影响结果
# -i      直接修改文档内容，不在屏幕上输出

# Na\     在当前行后添加文本
sed -e 1a\NewLineText xyz.txt # 在 xyz.txt 文件的第1行后面增加一行(NewLineText)，并将结果输出到 stdout

# i\      在当前行之前插入文本

# X,Yd    删除行 [X, Y] 行
nl xyz.txt | sed -e '3d'   # 仅删除第 3 行
nl xyz.txt | sed -e '3,$d' # 删除第 3 行到最后一行，$ 表示匹配到最后一行
nl xyz.txt | sed -e '2,4d' # 删除 xyz.txt 的第 [2, 4] 行，并将结果输出到 stdout

nl xyz.txt | sed -e '2a Drink tea ?' # 第二行后添加[Drink tea ?]
nl xyz.txt | sed -e '2i Drink tea ?' # 第二行前添加[Drink tea ?]

nl xyz.txt | sed -e '2a Drink tea ?\nDrink coffe ?' # 第 2 行后添加 2 行，\n标记换行
nl xyz.txt | sed -e '2i Drink tea ?\nDrink coffe ?' # 第 2 行前添加 2 行，\n标记换行

nl xyz.txt | sed '2,5c New data' # 将第 [2, 3] 行的内容取代成为[New data]

nl xyz.txt | sed '/ABC/d' # 删除 xyz.txt 中所有包含 ABC 的行

# 找到首次匹配包含 ABC 的行，执行后面花括号中的组命令，每个命令之间用分号分隔
# s/ABC/abc/  将该行中的所有 Abc 替换为 aBC
# p;          显示替换后结果
# q           处理结束
nl xyz.txt | sed -n '/Abc/{s/Abc/aBC/;p;q}'

# 字符串替换，分割字符可是 / 或 # 或 :
sed -i 's/OldStr/NewStr/'  xyz.txt # 仅替换第一次匹配
sed -i 's/OldStr/NewStr/g' xyz.txt # 替换所有匹配的项
sed -i 's#OldStr#NewStr#'  xyz.txt
sed -i 's#OldStr#NewStr#g' xyz.txt
sed -i 's:OldStr:NewStr:'  xyz.txt
sed -i 's:OldStr:NewStr:g' xyz.txt

############
# Also See #
############
cheat -t development
