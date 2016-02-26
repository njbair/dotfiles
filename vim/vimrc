"
" Nick Bair's Vim Configuration
"
" It's my favorite, because it's mine!
" http://nickbair.net
"

" needed for pathogen to function in jailed shell environments
set shell=/bin/bash
" load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
" update runtimepath variable to load plugins
" from ~/.vim/bundle using pathogen
" and refresh hepltags
call pathogen#infect()
call pathogen#helptags()



" break Vi compatibility and set Vim defaults
set nocompatible



"
" =Display
"
set ruler                  " always show cursor position in status bar
set showcmd                " show commands while typing
set number                 " show line numbers
set showtabline=2          " always show tab bar

" set font and colors
if has('win32')
    set guifont=Consolas:h11
else
    set guifont=Menlo\ 11
endif

set background=dark
let g:solarized_termtrans=1
colorscheme solarized



"
" =Syntax Highlighting
"
" enable syntax highlighting in color terminals
if &t_Co > 2 || has('gui_running')
    syntax on
endif



"
" =Formatting
"
" auto-indenting (based on filetype if available)
if has('autocmd')
    filetype plugin indent on
else
    set autoindent
endif

set textwidth=80           " line breaks at column 80
set formatoptions+=tcroql  " see :h fo and :h fo-table
set linebreak              " only break lines at certain character types
set nowrap                 " don't soft-wrap lines (it makes coding hard)
set tabstop=4              " tab size for tab key
set shiftwidth=4           " tab size for >> and << and autoindent
set expandtab              " use spaces instead of tabs

highlight ColorColumn ctermbg=cyan
call matchadd('ColorColumn', '\%81v', 100)

highlight SpecialKey ctermbg=none ctermfg=4
exec "set listchars=tab:\uBB\u2014,nbsp:~,trail:\uB7"
set list



"
" =Search
"
set incsearch   " incremental searching (find as you type)
set ignorecase  " case-insensitive searches
set nohlsearch  " do not highlight search results

function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=white ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction



"
" =Folding
"
set foldmethod=indent
set nofoldenable
set foldlevel=1



"
" =Misc
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" command line history
set history=50

" auto-save files when switching buffers
set autowrite

if has('autocmd')
    " create & initialize new autocmd group 'misc'
    augroup misc
        " clear group
        autocmd!

        " remember last known cursor position
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exec "normal! g`\"" |
                    \ endif

        autocmd BufEnter * lcd %:p:h

        " misc. filetypes
        autocmd BufRead,BufNewFile *.tpl set filetype=php
    augroup end

    augroup NoSimultaneousEdits
        autocmd!
        autocmd SwapExists * let v:swapchoice = 'o'
        autocmd SwapExists * echo 'Duplicate edit session (readonly)'
        autocmd SwapExists * echohl None
        autocmd SwapExists * sleep 2
    augroup end
endif

" enable mouse
set mouse=a



"
" =Abbreviations
"
" expand %% to [current directory] in command mode 
cabbr <expr> %% expand('%:p:h')



"
" =Commands
"
" diff the current buffer with the file from which it was loaded
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis |
    wincmd p | diffthis
endif



"
" =Keymappings
"
" break undo on line breaks in insert mode
inoremap <C-U> <C-G>u<C-U>

" save keystrokes by remapping ; to :
nnoremap ; :

" expand \e to :e [current directory] in normal mode
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" expand \w to the specified path
nnoremap <Leader>w :e ~/Projects/Web/

" tab shortcuts
nnoremap ,0 :tabfirst<CR>
nnoremap ,l :tabnext<CR>
nnoremap ,h :tabprevious<CR>
nnoremap ,$ :tablast<CR>
nnoremap ,x :tabclose<CR>
nnoremap ,m :tabmove

" map \nt to open/close NERDTree
nnoremap <Leader>nt :NERDTreeTabsToggle<CR>

" highlight next search term for easy finding
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

" keybindings for dragvisuals.vim
vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN> DVB_Drag('down')
vmap <expr> <UP> DVB_Drag('up')
vmap <expr> D DVB_Duplicate()
