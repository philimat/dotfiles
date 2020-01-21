" -----------------------------------------------------------------------------
" This config is targeted for Vim 8.0+ and expects you to have Plug installed.
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

call plug#begin()

" Conquer of Completion plugin for intellisense features
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Airline status bar and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy file finding
Plug 'ctrlpvim/ctrlp.vim'

" Navigate and manipulate files in a tree view.
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Cool icons for NERDTree
Plug 'ryanoasis/vim-devicons'

" show git file status in NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" A git wrapper.
Plug 'tpope/vim-fugitive'

" Show git file changes in the gutter.
Plug 'airblade/vim-gitgutter'

" Quick commenting
Plug 'scrooloose/nerdcommenter'

" Keyboard shortcuts to switch between vim and tmux windows
Plug 'christoomey/vim-tmux-navigator'

" Drastically improve insert mode performance in files with folds.
Plug 'Konfekt/FastFold'

" Dim paragraphs above and below the active paragraph.
Plug 'junegunn/limelight.vim'

" Gruvbox theme
Plug 'gruvbox-community/gruvbox'

" Better python folding
Plug 'tmhedberg/SimpylFold'

" Change surrounding parentheses, brackets, quotes, XML tags, and more
Plug 'tpope/vim-surround'

" Highlight search results as the search is being typed
Plug 'haya14busa/incsearch.vim'

" Plugin for better Conda integration
"Plug 'cjrh/vim-conda'

" Languages and file types.
Plug 'cakebaker/scss-syntax.vim'
Plug 'chrisbra/csv.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-git'
Plug 'vim-python/python-syntax'

call plug#end()

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------
set t_Co=256
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Gruvbox comes with both a dark and light theme.
set background=dark
" Gruvbox has 'hard', 'medium' (default) and 'soft' contrast options.
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='medium'

colorscheme gruvbox
" For Gruvbox to look correct in terminal Vim you'll want to source a palette
" script that comes with the Gruvbox plugin.

" Add this to your ~/.profile file:
"   source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

" This needs to come last, otherwise the colors aren't correct.
syntax on

" Fix the ultra disgusting visual selection colors of gruvbox (thanks @romainl).
if (&background == 'dark')
  hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
else
  hi Visual cterm=NONE ctermfg=NONE ctermbg=223 guibg=#ffd7af
endif

" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif


" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------
set encoding=UTF-8
let mapleader = ','

"turn relative row numbers on
set rnu

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" better yank to clipboard
set clipboard^=unnamed,unnamedplus
set pastetoggle=<leader>p
set showmode
" set tabs to have 4 spaces
set tabstop=4
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" always uses spaces instead of tab characters
set expandtab

" indent when moving to the next line while writing code
set autoindent

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" highlight search results as they are being typed
set hlsearch
set incsearch

set nocompatible
filetype plugin on
set nofoldenable    " disable folding on file open

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile" enable all Python syntax highlighting features

let python_highlight_all = 1

let g:markdown_folding = 1
" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" Quick open new tab
nmap <Leader>t :tabnew<CR>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Format paragraph (selected or not) to 80 character lines.
nnoremap <Leader>g gqap
xnoremap <Leader>g gqa

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>

" Toggle spell check.
map <F5> :setlocal spell!<CR>

" quick set up a python breakpoint
map <Leader>b Oimport pdb; pdb.set_trace() # BREAKPOINT<C-c>

au FileType html setlocal foldmethod=indent
au FileType markdown setlocal foldmethod=indent
" conda-vim settings
" let g:conda_startup_msg_suppress = 1

" coc config
let g:coc_global_extensions = [
  \ 'coc-markdownlint',
  \ 'coc-yank',
  \ 'coc-python',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-git',
  \ 'coc-texlab',
  \ 'coc-gitignore',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-yaml',
  \ 'coc-xml',
  \ 'coc-sql',
  \ ]

" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------

" .............................................................................
" scrooloose/nerdtree
" .............................................................................

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

nmap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter *.py NERDTree

let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

" .............................................................................
" junegunn/limelight.vim
" .............................................................................

let g:limelight_conceal_ctermfg=244

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................

" specify browser to open preview page
" default: ''

let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
" npm install github-markdown-css
let g:mkdp_markdown_css='/home/philimat/node_modules/github-markdown-css/github-markdown.css'

" OS specific settings
" Map Ctrl + / for Windows and Linux and Cmd + / for macOS to toggle comments
" iTerm2 or another terminal that can remap the Cmd + / to ++ must be used it to work on macOS
let echoOS = 0
if system('uname -s') == "Darwin\n"
  "OSX
  if echoOS
    echo "MacOS Detected"
  endif
  let g:mkdp_browser='safari'
  nmap ++ <plug>NERDCommenterToggle
  vmap ++ <plug>NERDCommenterToggle
elseif has('unix')
  "Linux
  if echoOS
    echo "Unix Detected"
  endif
  let g:mkdp_browser='chrome'
  nmap <C-_> <plug>NERDCommenterToggle
  vmap <C-_> <plug>NERDCommenterToggle
elseif has('win32')
	"Windows
  if echoOS
    echo "Windows Detected"
  endif
  let g:mkdp_browser='chrome'
  nmap <C-_> <plug>NERDCommenterToggle
  vmap <C-_> <plug>NERDCommenterToggle
else
	echo "Vim could not detect the current operating system. Some settings could not be loaded"
endif
" .............................................................................
" sources that I stole/got inspried by for this .vimrc
" .............................................................................
" https://github.com/nickjj/dotfiles/blob/master/.vimrc
" https://github.com/mbrochh/vim-as-a-python-ide/blob/master/.vimrc
" https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f
