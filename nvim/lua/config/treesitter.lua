-- nvim-treesitter `main` branch (the old `master` is frozen/archived).
-- There is no configs.setup() anymore: parsers are installed explicitly and
-- highlighting is enabled per-buffer via vim.treesitter.start() in a
-- FileType autocmd. Requires nvim 0.11+ and the tree-sitter CLI.
return {
  config = function()
    local ensure_installed = {
      'python', 'cpp', 'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'tsx',
      'graphql', 'html', 'css', 'prisma', 'json', 'yaml', 'bash',
      'markdown', 'markdown_inline',
    }
    require('nvim-treesitter').install(ensure_installed)

    local max_filesize = 100 * 1024 -- 100 KB
    -- c/rust intentionally stay on legacy syntax highlighting
    local disabled_langs = { c = true, rust = true }

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter_highlight', { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang or disabled_langs[lang] then
          return
        end
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
        if ok and stats and stats.size > max_filesize then
          return
        end
        pcall(vim.treesitter.start, args.buf, lang)
      end,
    })
  end
}
