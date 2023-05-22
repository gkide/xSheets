---
tags: [ development ]
---
# awk 调用 Shell 命令方式一 system()
awk 'BEGIN{system("echo abc")}'                 # 等同于 $ echo abc
awk 'BEGIN{v1="echo";v2="abc";system(v1" "v2)}' # 等同于 $ echo abc
awk 'BEGIN{v1="echo";v2=" abc";system(v1 v2)}'  # 等同于 $ echo abc
awk 'BEGIN{v1="echo";v2="abc";system(v1 v2)}'   # 执行后显示 sh: 1: echoabc: not found
# 如果 system() 括号里面的参数没有加上双引号的话，awk 认为它是一个变量，
# 它会从 awk 的变量里面把它们先置换为常量，然后再回传给 Shell 执行，所以 system()
# 里的空格的作用是 awk 变量变量分割，system() 双引号内容直接传递给 Shell 执行

# awk 调用 Shell 命令方式二 print
awk 'BEGIN{print "echo","abc" | "bash"}'                # 等同于 $ bash -c "echo abc"
awk 'BEGIN{print "var=abc;","echo","$var"| "bash"}'  # 等同于 $ bash -c "var=abc; echo $var"

# system() 和 print 方式调用 Shell 命令时，创建子 Shell，若当前 Shell
# 环境变量 VAR 没有 export，则无法在 awk 新创建的子 Shell 中使用
export XYZ=ABC
awk 'BEGIN{system("echo $XYZ")}'
awk 'BEGIN{print "echo","$XYZ"|"bash"}'

############
# Also See #
############
cheat -t development
