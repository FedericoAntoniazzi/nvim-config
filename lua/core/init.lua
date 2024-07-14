-- Enable 24-bit RGB colors
if (vim.fn.has('termguicolors')) then
    vim.opt.termguicolors = true
end
require("core.system")
require("core.mappings")
require("core.editor")
require("core.ui")
