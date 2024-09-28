
-- local hour = tonumber(os.date("%H"))
--
-- if hour < 6 or hour > 18 then
--     vim.opt.background = "dark"
-- else
--     vim.opt.background = "light"
-- end


return {
    "folke/tokyonight.nvim",
    lazy=false,
    priority=1000,
    opts={},
    config=function()
        vim.cmd.colorscheme("tokyonight-storm")
    end
}

