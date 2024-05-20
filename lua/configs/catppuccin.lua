local mergeSchemas = function (t1, t2)
  for k,v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

local catppuccinGenericOpts = {
  transparent_background = true,
  flavour = "mocha"
}

local overrideOpts = {}
if vim.loop.os_uname().sysname == "Darwin" then
  overrideOpts = {
    transparent_background = false
  }
end

local catppuccinOpts = mergeSchemas(catppuccinGenericOpts, overrideOpts)
require("catppuccin").setup(catppuccinOpts)
