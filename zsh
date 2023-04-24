---
tags: [ zsh ]
---
#############################
# 关于 shell 内置的帮助函数 #
#############################
help # bash 内置的帮助函数
run-help # zsh 内置的帮助函数
help test # test 或 [ ... ] 的使用说明
run-help test # test 或 [ ... ] 的使用说明
# bash -c "help $@"
# This function used to call the "bash" builtin.
# https://stackoverflow.com/questions/4405382/how-can-i-read-documentation-about-built-in-zsh-commands

# 显示当前会话的所有函数定义
functions # only works for zsh
declare -f # works for bash & zsh
typeset -f # works for bash & zsh

type CmdName # only works for bash
type -f CmdName # only works for zsh
declare -f [CmdName] # works for bash & zsh

whence -f CmdName # only works for zsh

# 显示当前会话所有加载的 shell 函数名列表
declare -F # only works for bash
typeset -f + # only works for zsh
typeset -f -U + # only works for zsh

# bash/zsh cmds
# which         is defined by zsh as equivalent to    whence -c
# type          is defined by zsh as equivalent to    whence -v
# functions     is defined by zsh as equivalent to    typeset -f
# declare       is defined by zsh as equivalent to    typeset
#
# NOTE:
# man zsh              zsh  简要的分类说明
# man zshall           zsh  简要的分类说明
# man zshbuiltins      zsh  内置命令帮助手册
# man bash-builtins    bash 内置命令帮助手册

zsh --help      # 显示 zsh 命令选项
zsh --version   # 显示 zsh 版本号
zsh -v          # 显示 zsh 所有加载的配置内容, 等同于 --verbose

####################
# zsh 配置加载顺序 #
####################
# Read down the appropriate column. Executes A, then B, then C, etc.
# +----------------+-----------+-----------+------+
# |                |Interactive|Interactive|Script|
# |                |   Login   | Non-Login |      |
# +----------------+-----------+-----------+------+
# | /etc/zshenv    |    A      |    A      |  A   |
# +----------------+-----------+-----------+------+
# | ~/.zshenv      |    B      |    B      |  B   |
# +----------------+-----------+-----------+------+
# | /etc/zprofile  |    C      |           |      |
# +----------------+-----------+-----------+------+
# | ~/.zprofile    |    D      |           |      |
# +----------------+-----------+-----------+------+
# | /etc/zshrc     |    E      |    C      |      |
# +----------------+-----------+-----------+------+
# | ~/.zshrc       |    F      |    D      |      |
# +----------------+-----------+-----------+------+
# | /etc/zlogin    |    G      |           |      |
# +----------------+-----------+-----------+------+
# | ~/.zlogin      |    H      |           |      |
# +----------------+-----------+-----------+------+
# | ~/.zlogout     |    I      |           |      |
# +----------------+-----------+-----------+------+
# | /etc/zlogout   |    J      |           |      |
# +----------------+-----------+-----------+------+

############
# Also See #
############
cheat -t shell
cheat -t terminal
