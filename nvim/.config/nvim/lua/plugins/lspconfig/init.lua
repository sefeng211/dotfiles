-- 1. 基础快捷键绑定（保持不变）
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)     -- 跳转定义
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)           -- 悬停文档
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- 变量重命名
  vim.keymap.set('n', '<leader>cf',
    function()
        vim.lsp.buf.format({ async = true })
    end,
    { desc = "LSP Format File" }
  )
end

-- 2. 联动补全组件（保持不变）
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 3. 🌟 原生注册并启用 clangd
vim.lsp.config('clangd', {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--compile-commands-dir=build" -- 告诉它你的 json 在 build 目录下
  },
  -- 🌟 告诉 Neovim 看到什么文件时，认为进入了 C++ 项目根目录
  root_markers = { "compile_commands.json", "CMakeLists.txt", ".git" },
  capabilities = capabilities,
})

-- 4. 🌟 必须显式激活这个配置（0.11+ 的关键一步）
vim.lsp.enable('clangd')

-- 5. 绑定快捷键到 LspAttach 事件上
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "clangd" then
      on_attach(client, args.buf)
    end
  end,
})
