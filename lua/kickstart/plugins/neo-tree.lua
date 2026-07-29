-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      -- Keep noisy generated/dependency files hidden by default.
      -- Press `H` in Neo-tree to temporarily reveal filtered items.
      visible = false,

      -- Keep dotfiles visible unless they are ignored or explicitly hidden below.
      hide_dotfiles = false,

      -- Hide files/folders ignored by Git or ignore-style files by default
      -- e.g. node_modules, dist, build, coverage, .next.
      hide_gitignored = true,
      hide_ignored = true,

      -- Keep filesystem-hidden items visible unless another filter hides them.
      hide_hidden = false,

      -- Keep useful project metadata visible even when an ignore rule matches.
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
