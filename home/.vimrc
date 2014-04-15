" prologue stuff, set up the general vim environment
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set nocompatible

" have vim jump back to previous position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif


" fix double-mapped todolist
map <leader>v <Plug>TaskList
" following settings were cribbed from
" http://stevelosh.com/blog/2010/09/coming-home-to-vim
" set the Lord's syntax settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" set some other sweet settings
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
syntax on

" now, the <leader> key is what i'm hitting all day
" make it something that is always in the same place
" stupid backspace key is all over the place
let mapleader=","

" force VIM to use PERL-compatible regexes, and not its own dumb format
nnoremap / /\v
vnoremap / /\v

" misc searching options
" next two lines make all lowercase search terms search case-insensitive
" but then if you put case in your term, then it does case-sensitive
set ignorecase
set smartcase

" do s/ / /g by default instead of s/ / /
set gdefault

" highlight search values as you go
set incsearch
set showmatch
set hlsearch

" sets ,<space> to blow away the highlighted searches
nnoremap <leader><space> :noh<cr>

" makes tab jump to the next bracket (instead of having to use %)
nnoremap <tab> %
vnoremap <tab> %

" makes ctrl-N ctrl-N toggle the line number
:set number
:nmap <C-N><C-N> :set invnumber<CR>

" set some wrapping preferences. If I was nightmare mode, I'd do 
"     set wrap
"     set textwidth=79
"     set formatoptions=qrn1
" but instead, I'll do
if exists("&colorcolumn")
:set colorcolumn=80
endif
" which is a recent vim thing. I need to update my script to build local
" versions of important binaries

" COLD TURKEY VIM
" this disables using the arrow keys in normal mode
" nightmare mode would be to disable arrow keys in insert mode, but I dont
" think I want to spend a lot of time switching between modes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" this makes arrow keys behave like a sane thing and causes them to use screen
" lines instead of "file lines", which is basically obnoxious once you have
" giant word-wrapped lines
nnoremap j gj
nnoremap k gk

" help key is next to escape, which kinda blows
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" make VIM save files whenever you change to another window/tab. VIM
" has a persistent, perpetual undo function. worse case, you can back it out
au FocusLost * :wa

" set the statusline
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)%{fugitive#statusline()}
"
" Some handy macros
"
" Kill trailing whitespace
noremap <leader>W :%s/\s+$//<cr>:let @/=''<CR>
" change "new split" to "new split and then switch to it"
nnoremap <leader>w <C-w>v<C-w>l
" add some speedy window-changing macros
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make a new terminal with :Terminal
function! s:Terminal()
  execute 'ConqueTermSplit bash --login'
endfunction
command! Terminal call s:Terminal()

filetype on
filetype plugin indent on

" Python stuff
" from http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide#basic-editing-and-debugging
if has("&foldmethod")
    set foldmethod=indent
    set foldlevel=99
endif
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
map <leader>n :NERDTreeToggle<CR>
map <leader>g :GundoToggle<CR>
let g:pyflakes_use_quickfix = 0
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
nmap <leader>a <Esc>:Ack!
" %{fugitive#statusline()}
" remap <leader>W :%s/\s+$//<cr>:let @/=''<CR>
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

"
" COLORS
"

:set t_Co=256 " 256 colors
:set background=dark
:color molokai
:highlight Normal ctermfg=white ctermbg=black
:set fenc=utf-8
inoremap jj <ESC>
":set autoindent
":set tabstop=4
":set shiftwidth=4
":set pastetoggle=<F12>
":set softtabstop=4
":set noexpandtab
"":set virtualedit=all
":map <Up> gk
":map <Down> gj
"set expandtab
"set softtabstop=4
"set shiftwidth=4
"set autoindent
"set tabstop=4
"set shiftwidth=4
"set autoindent
"set smartindent
"set vb t_vb=
"set showmatch
"syntax on
"set ruler
"set foldmethod=indent
"set foldlevel=99
