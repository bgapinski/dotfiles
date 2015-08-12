# start X at login
# if status --is-login
#   if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
#     exec startx -- -keeptty
#   end
# end

fish_vi_mode
set -gx PATH $PATH /home/brian/.scripts
