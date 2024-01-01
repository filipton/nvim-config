local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require("lazy").setup({
    { import = "plugins" },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_assume_mapped = true
        end
    },
    {
        'j-hui/fidget.nvim'
    }
    -- {
    --     'folke/trouble.nvim',
    --     requires = 'nvim-tree/nvim-web-devicons',
    --     config = function()
    --         require("trouble").setup({})
    --
    --         vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    --             { silent = true, noremap = true })
    --     end
    -- }
})
