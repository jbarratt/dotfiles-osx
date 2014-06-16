set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

":BundleInstall! to update
":BundleClean to remove if you remove lines from this

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'Gundo'
Bundle 'Python-mode-klen'
Bundle 'FuzzyFinder'
Bundle 'UltiSnips'
Bundle 'Solarized'
Bundle 'fugitive.vim'
Bundle 'vim-octopress'
Bundle 'plantuml-syntax'
Bundle 'Puppet-Syntax-Highlighting'
Bundle 'repeat.vim'
Bundle 'surround.vim'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'matthias-guenther/hammer.vim'
Bundle 'airblade/vim-gitgutter'
Bundle "lepture/vim-jinja"
Bundle 'VOoM'
Bundle 'derekwyatt/vim-scala'
Bundle 'jnwhiteh/vim-golang'
Bundle 'dgryski/vim-godef'
Bundle 'tpope/vim-markdown'

set nobackup
set noswapfile

" fix arrow keys so I can't use them
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" make up and down keys work on screen lines instead of file lines
nnoremap j gj
nnoremap k gk

"set ai to terse nowarn sm ruler redraw sw=2 ts=2
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
set ai
set to "timeout for getting commands
set ruler redraw
set expandtab smarttab

" Make these work like TextMate
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set sw=4

set encoding=utf8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber


set bs=2
set hls

" q: format comments with 'gq'
" r: auto-insert comment leader on newline
" n: numbered lists
set formatoptions=qrn1

" set a colored mark at 85 columns
set colorcolumn=85

" make searches more perl compatible
nnoremap / /\v
vnoremap / /\v

" all lowercase searches are case-insensitive;
" mixed case searches are sensitive
set ignorecase
set smartcase

" search and replace defaults to /g. Add a /g to turn it off.
set gdefault

" show searches incrementally as we search for them
set incsearch
set showmatch
set hlsearch
" shortcut for noh, <leader>' '
nnoremap <leader><space> :noh<cr>

" bounce between brackets with <TAB>
nnoremap <tab> %
vnoremap <tab> %

" supposed to make vim use the system clipboard
" This is annoying. Turn it off.
" set clipboard=unnamed

" for when you edit a file you forgot you'll need perms for afterwards
cmap w!! w !sudo tee % >/dev/null

" 1 liner emulation of a.vim
map <leader>a :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1

" make jj work to get you out of modes
imap jj <Esc>

syntax enable
filetype plugin indent on

let g:solarized_termtrans=1
"let g:solarized_contrast  = "light"
set t_Co=256
let g:solarized_termcolors = 256
let g:solarized_bold = 0


set background=dark
colorscheme solarized

let mapleader = ','

set wildmenu

au BufNewFile,BufRead *.t set filetype=perl

" fuzzy finder (lifted from justone)
let g:fuf_modesDisable = [ 'mrucmd', ]
let g:fuf_coveragefile_exclude = '\v\~$|blib|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_mrufile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po])$|^(\/\/|\\\\|\/mnt\/|\/media\/)|svn-base$'
let g:fuf_maxMenuWidth = 150
"let g:fuf_previewHeight = 20

noremap <leader>ff :FufCoverageFile<CR>
noremap <leader>fr :FufMruFile<CR>
noremap <leader>fl :FufMruFileInCwd<CR>
noremap <leader>ft :FufTag<CR>
noremap <leader>fb :FufBuffer<CR>
noremap <leader>fc :FufRenewCache<CR>

" make SPACE do a 'next page'
nnoremap <SPACE> <PAGEDOWN>

" auto-reload vimrc files if you edit them
augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" tune undo history; keep things forever but consildated
if has('persistent_undo')
    set undofile
endif

set undodir=$HOME/tmp/.VIM_UNDO_FILES
set undolevels=5000

" turn on block mode (get to it with CTRL-V) virtualedit (no char needed)
set virtualedit=block

" when I open a file jump back to where my cursor was
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") 
\|  exe "normal! g`\""
\| endif

" make window nav like tmux
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:pymode_lint_checker = "pep8,mccabe"
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" custom surroundings for confluence editing
" 'l' for literal. So 'ysWl' to surround from cursor to end of word
let g:surround_108 = "{{\r}}"
" 'n' for noformat
let g:surround_110 = "{noformat}\r{noformat}"


au BufNewFile,BufRead *.j2 set ft=jinja

nmap <leader>vp :!pandoc -t html -T 'Pandoc Generated - "%"' --smart --standalone --self-contained --data-dir %:p:h -c ~/.dotfiles/css/buttondown.css % \|bcat<cr><cr>
nmap <leader>vv :!pandoc -t html -T 'Pandoc Generated - "%"' --smart --standalone --self-contained --data-dir %:p:h -c ~/.dotfiles/css/pandoc.css % \|bcat<cr><cr>
