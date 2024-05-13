local lint = require('lint')
lint.linters_by_ft = {
  go = {'staticcheck',}
}

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

lint.linters.staticcheck = require("lint.util").wrap(lint.linters.staticcheck, function(diagnostic)
  diagnostic.severity = vim.diagnostic.severity.HINT
  return diagnostic
end)
