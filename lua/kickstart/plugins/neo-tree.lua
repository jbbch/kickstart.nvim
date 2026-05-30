-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local plugins = {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons') -- not strictly required, but recommended
end

vim.pack.add(plugins)

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      -- Keep noisy generated/dependency files hidden by default.
      -- Press `H` in Neo-tree to temporarily reveal filtered items.
      visible = false,

      -- Hide dotfiles by default, then opt useful project dotfiles back in below.
      -- This keeps the `H` toggle behavior predictable.
      hide_dotfiles = false,

      -- Hide files/folders ignored by Git or ignore-style files by default
      -- e.g. node_modules, dist, build, coverage, .next.
      hide_gitignored = true,
      hide_ignored = true,

      -- Mostly relevant on Windows; dotfiles cover the common macOS/Linux case.
      hide_hidden = false,

      always_show = {
        '.gitignore',
        '.github',
      },

      always_show_by_pattern = {
        '.env.*',
        '.mcp.*',
      },

      never_show = {
        '.git',
        '.idea',
        '.playwright-mcp',
        '.turbo',
        'node_modules',
        '.DS_Store',
        'thumbs.db',
      },
    },

    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
