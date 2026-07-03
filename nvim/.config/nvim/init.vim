source ~/.config/nvim/viml/mappings.vim
source ~/.config/nvim/viml/plugins.vim
source ~/.config/nvim/viml/settings.vim
source ~/.config/nvim/viml/commands.vim
source ~/.config/nvim/viml/config.vim

set rtp+=~/.config/nvim/viml

lua << EOF
require('config')

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" , "h", "hpp" },
  callback = function()
    vim.bo.equalprg = "clang-format -style=file"
  end,
})
EOF
