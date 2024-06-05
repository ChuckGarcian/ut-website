---
title: "nvim cheatsheet"
---

# nvim Configuration Cheatsheet

## Cursor movement:

h move one character left
j move one row down
k move one row up
l move one character right
If you are a touch typist like me you will like these movements because you don’t have to leave a ‘home row’. Keys ‘h’ and ‘l’ were easy to remember for me but ‘jk’ took me some time to used to.

## Word movements:

w move to the beginning of the next word
b move to the previous beginning of the word
e move to the end of the word
ge move to the end of the previous word
W move to the beginning of the next word after a whitespace
B move to the beginning of the previous word before a whitespace
E move to the end of a word before a whitespace

## Beginning/End of line movement:

0 move to the beginning of the line
$ move to the end of the line

## Custom Keybinds

### Normal Mode Keybindings
- `J`: Join the current line with the line below, cursor stays in place.
- `<C-d>`: Scroll down half a page and center the cursor.
- `<C-u>`: Scroll up half a page and center the cursor.
- `n`: Move to the next search result and center the cursor.
- `N`: Move to the previous search result and center the cursor.
- `<leader>p`: Paste from system clipboard.
- `<leader>y`: Yank to system clipboard.
- `<leader>Y`: Yank the whole line to system clipboard.
- `<leader>d`: Delete without yanking.
- `<C-f>`: Open a new tmux window.
- `<leader>f`: Format the current buffer using LSP.
- `<C-k>`: Jump to the next item in the quickfix list and center the cursor.
- `<C-j>`: Jump to the previous item in the quickfix list and center the cursor.
- `<leader>k`: Jump to the next item in the location list and center the cursor.
- `<leader>j`: Jump to the previous item in the location list and center the cursor.
- `<leader>s`: Replace the word under the cursor throughout the file.
- `<leader>x`: Make the current file executable.

### Visual Mode Keybindings
- `J`: Move the selected lines down.
- `K`: Move the selected lines up.
- `<leader>y`: Yank to system clipboard.
- `<leader>d`: Delete without yanking.
- `<leader>p`: Paste from system clipboard.

### Insert Mode Keybindings
- `<C-c>`: Exit insert mode.

### Global Keybindings
- `q`: Disable recording macros.
- `Q`: Disable ex mode.

## Plugin Keybinds

### Telescope
- `Telescope` (Default keybindings, customizable within Telescope setup)

### Treesitter
- `nvim-treesitter` (Used for syntax highlighting and code parsing)

### Harpoon
- `theprimeagen/harpoon` (Navigation between files, default keybindings need to be set up)

### Undotree
- `mbbill/undotree` (Undo history visualization, typically `<leader>u` to toggle)

### Fugitive
- `tpope/vim-fugitive` (Git integration, typically `:G` commands)

### Lualine
- `nvim-lualine/lualine.nvim` (Status line configuration, no keybindings)

### Tabby
- `nanozuki/tabby.nvim` (Tab management, default keybindings need to be set up)

### COQ
- `ms-jpq/coq_nvim`, `coq.artifacts`, `coq.thirdparty` (Autocompletion, integrated with LSP)

### Glow
- `ellisonleao/glow.nvim` (Markdown preview, typically `<leader>p` for preview)

### Neo-tree
- `nvim-neo-tree/neo-tree.nvim` (File explorer, default keybindings need to be set up)

### LSP Zero
- `VonHeikemen/lsp-zero.nvim` (LSP configuration, integrated keybindings with LSP)

## Tips and Tricks

- **Navigating Buffers**: Use `:bnext` and `:bprev` to navigate between open buffers.
- **Splits Management**: Use `:split` or `:vsplit` to open splits and `Ctrl+w` followed by arrow keys to navigate.
- **Saving Files**: Use `:w` to save the current file and `:wa` to save all open files.
- **Exiting Vim**: Use `:q` to quit, `:qa` to quit all, and `:wq` to save and quit.
- **Search and Replace**: Use `:%s/old/new/g` to replace all occurrences of `old` with `new` in the current file.
- **Command-Line Mode**: Press `:` to enter command-line mode for various commands.

## Additional Information

### General Settings
- **Relative Line Numbers**: Enabled for easier navigation (`:set relativenumber`).
- **Tab and Indentation**: Tabs set to 4 spaces, uses spaces instead of tabs (`:set tabstop=4 shiftwidth=4 expandtab`).
- **No Swapfile**: Disabled swapfile for performance (`:set noswapfile`).
- **Incremental Search**: Enabled for better search experience (`:set incsearch`).
- **Color Column**: Highlight column 80 for better readability (`:set colorcolumn=80`).

### Resources for Further Learning
- [Vim Adventures](https://vim-adventures.com/): A game to learn Vim.
- [Learn Vim](https://www.learnvim.com/): A comprehensive guide to Vim.
- [Neovim Wiki](https://github.com/neovim/neovim/wiki): Official wiki for Neovim.
- [Vimcasts](http://vimcasts.org/): Screencasts about Vim.

### Common Pitfalls
- **Modes Confusion**: Remember the different modes in Vim (Normal, Insert, Visual, Command-line).
- **Exit Struggles**: If stuck, use `:q!` to force quit without saving.
- **Over-customization**: Start simple and gradually add customizations.

Using this cheatsheet, you should be able to navigate and use your friend's nvim configuration effectively, enhancing your productivity and learning experience.

--------------------------------------------------------------------------------
# Examle: Creating a project
1. Creating the project:
   - Open your terminal and navigate to the directory where you want to create your project using the `cd` command.
   - Create a new directory for your project using the `mkdir` command. For example: `mkdir my-project`.
   - Change into the project directory using `cd my-project`.
   - Open Neovim in the project directory by running `nvim`.

2. Navigating and editing the project:
   - Opening Neo-tree:
     - Press `<leader>e` (space followed by 'e') to toggle the Neo-tree file explorer.
     - Use the arrow keys or `j` and `k` to navigate through the files and directories.
     - Press `<Enter>` to open a file or expand a directory.
     - Press `a` to add a new file or directory.
     - Press `d` to delete a file or directory.
     - Press `r` to rename a file or directory.
   - Finding files with Telescope:
     - Press `<leader>ff` (space followed by 'ff') to open the Telescope file finder.
     - Start typing the name of the file you want to find.
     - Use the arrow keys or `j` and `k` to navigate through the search results.
     - Press `<Enter>` to open the selected file.
   - Navigating with Harpoon:
     - Press `<leader>a` (space followed by 'a') to add the current file to Harpoon.
     - Press `<leader>1`, `<leader>2`, etc., to quickly jump to the corresponding Harpoon-marked file.
   - Editing code:
     - Use Vim's standard navigation commands (`h`, `j`, `k`, `l`) to move around within files.
     - Press `i` to enter insert mode and start typing.
     - Press `<Esc>` to exit insert mode and return to normal mode.
     - Use visual mode to select text by pressing `v` for character-wise selection, `V` for line-wise selection, or `<Ctrl-v>` for block-wise selection.
     - Perform actions on the selected text, such as copying with `y`, cutting with `d`, or pasting with `p`.
   - Formatting code:
     - Press `<leader>f` (space followed by 'f') to format the current buffer using the language server.
   - Using Undotree:
     - Press `<leader>u` (space followed by 'u') to toggle the Undotree window.
     - Use the arrow keys or `j` and `k` to navigate through the undo history.
     - Press `<Enter>` to select a specific undo state.

3. Committing, pushing, and making:
   - Using Fugitive for Git integration:
     - Press `:Git` to open the Git status window.
     - Use `s` to stage files or `u` to unstage files.
     - Press `c` to commit staged changes. Enter your commit message in the new buffer and save it.
     - Press `:Git push` to push your commits to the remote repository.
     - Press `:Git pull` to pull changes from the remote repository.
     - Use `:Git branch <branch-name>` to create a new branch and `:Git checkout <branch-name>` to switch to a different branch.
   - Resolving merge conflicts:
     - If a merge conflict occurs, Fugitive will open the conflicting files in Neovim.
     - Edit the files to resolve the conflicts by removing the conflict markers and keeping the desired changes.
     - Stage the resolved files using `:Git add` and commit the changes.

4. Additional tips:
   - Customizing settings:
     - Open the Neovim configuration file (`init.lua`) to modify settings, keybindings, or installed plugins.
     - Use the `:so`
