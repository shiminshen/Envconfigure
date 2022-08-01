local wilder = require('wilder')
wilder.setup({modes = {':', '?'}})

wilder.set_option('pipeline', {
  wilder.branch(
  wilder.cmdline_pipeline({
    fuzzy = 1,
    set_pcre2_pattern = 1,
  }),
  wilder.python_search_pipeline({
    pattern = 'fuzzy',
  })
  ),
})

wilder.set_option('renderer', wilder.popupmenu_renderer({
  -- highlighter applies highlighting to the candidates
  highlighter = wilder.basic_highlighter(),
}))
