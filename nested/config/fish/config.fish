# start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
    exec startx -- -keeptty
  end
end

if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

fish_vi_key_bindings
set -gx PATH /home/brian/.cabal/bin /home/brian/.scripts /usr/local/bin $PATH
