source ~/.config/nvim/viml/mappings.vim
source ~/.config/nvim/viml/plugins.vim
source ~/.config/nvim/viml/settings.vim
source ~/.config/nvim/viml/commands.vim
source ~/.config/nvim/viml/config.vim

set rtp+=~/.config/nvim/viml

lua << EOF
require('config')
EOF
