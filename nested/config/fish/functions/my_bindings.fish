function my_bindings
  fish_vi_key_bindings
  bind -M $argv \cl 'clear; commandline -f repaint'
  bind -M insert $argv \cl 'clear; commandline -f repaint'
  bind -M visual $argv \cl 'clear; commandline -f repaint'
end

set -g fish_key_bindings my_bindings
