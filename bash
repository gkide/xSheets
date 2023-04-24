---
tags: [ bash ]
---
# Bash 配置文件加载顺序
#
# Read down the appropriate column. Executes A, then B, then C, etc.
# The B1, B2, B3 means it executes only the first of those files found.
# (A) or (B3) means it is normally sourced by (read by and included in)
# the primary file, in this case A or B3.
# +-----------------------------------+-----------+-----------+------+
# |                                   |Interactive|Interactive|Script|
# |                                   |   Login   | Non-Login |      |
# +-----------------------------------+-----------+-----------+------+
# |                                   |           |           |      |
# |            ALL USERS              |           |           |      |
# |                                   |           |           |      |
# +-----------------------------------+-----------+-----------+------+
# | BASH_ENV                          |           |           |  A   | not interactive or login
# +-----------------------------------+-----------+-----------+------+
# | /etc/profile                      |     A     |           |      | set PATH & PS1, & call following:
# +-----------------------------------+-----------+-----------+------+
# | /etc/bash.bashrc                  |    (A)    |     A     |      | Better PS1 + command-not-found
# +-----------------------------------+-----------+-----------+------+
# | /etc/profile.d/bash_completion.sh |    (A)    |           |      |
# +-----------------------------------+-----------+-----------+------+
# |                                   |           |           |      |
# |          SPECIFIC USER            |           |           |      |
# |                                   |           |           |      |
# +-----------------------------------+-----------+-----------+------+
# | ~/.bash_profile    (bash only)    |    B1     |           |      | currently do NOT used for most distrubitions
# +-----------------------------------+-----------+-----------+------+
# | ~/.bash_login      (bash only)    |    B2     |           |      | currently do NOT used for most distrubitions
# +-----------------------------------+-----------+-----------+------+
# | ~/.profile         (all shells)   |    B3     |           |      |
# +-----------------------------------+-----------+-----------+------+
# | ~/.bashrc          (bash only)    |   (B3)    |     B     |      | colorizes bash: su=red, other_users=green
# +-----------------------------------+-----------+-----------+------+
# | ~/.bash_logout     (bash only)    |    C      |           |      |
# +-----------------------------------+-----------+-----------+------+
#
# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
#
# http://meta.ath0.com/2007/10/23/cleaning-up-bash-customizations/
# https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile

# Bash Predefined Variables
# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
# https://tldp.org/LDP/abs/html/internalvariables.html

############
# Also See #
############
cheat -t zsh
cheat -t shell
cheat -t terminal
