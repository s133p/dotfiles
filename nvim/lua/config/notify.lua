vim.notify = require("notify")
vim.notify.setup({
    top_down = false,
    icons = {
        DEBUG = " ",
        ERROR = "🛑 ",
        INFO = "ℹ️ ",
        TRACE = "✎ ",
        WARN = "🔥 "
        },
    render = "default",
    timeout = 1000
})
