execute pathogen#infect()
set nocompatible
filetype plugin on
filetype indent on
set guifont=Consolas:h10.2:cANSI
set guioptions+=LlRrbmT
set guioptions-=LlRrbmT
set encoding=utf-8
set laststatus=2
" disable beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb=
endif
syntax on
let g:airline_powerline_fonts = 1
set noswapfile
set number
set hidden
set cursorline
set mouse=a
set autoindent
set si
set history=1000
set noexpandtab                 " tabs are tabs, not spaces
set shiftwidth=4
set tabstop=4
set ignorecase
set incsearch
set hlsearch
set noshowmatch
set wildmode=longest,list,full
set wildmenu
set backspace=indent,eol,start  " backspace for dummys
set t_Co=256
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
"set pastetoggle=<F12>            " pastetoggle (sane indentation on pastes)
set completeopt=longest,menuone,preview "don't autoselect first item in omnicomplete,show if only one item(for preview)    
"colorscheme solarized
let g:molokai_original = 1
colorscheme molokai
set gdefault                    " the /g flag on :s substitutions by default
"inoremap <C-Space> <C-x><C-o>
"highlight Pmenu ctermbg=238 gui=bold
set makeprg=build
set errorformat=\ %#%f(%l\\\,%c):\ %m
"use insert cursor when in insert mode in terminal
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
if exists('$TMUX')
  let &t_SI = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[0 q"
endif
"Java anonymous classes. Sometimes, you have to use them.
"set cinoptions+=j1
"set tags=/home/jason/workspace/LateRoomsAndroidClient
"Make window smaller
"map - <C-W>-
"Make window bigger
"map = <C-W>+

map <F6> <C-W>w
map <F7> :NERDTreeToggle<cr>
"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

let g:OmniSharp_timeout = 10
"Set the type lookup function to use the preview window instead of the status line
let g:OmniSharp_typeLookupInPreview = 1
"load code documentation at bottom of the screen instead of top
set splitbelow 
map <F12> :call OmniSharp#GotoDefinition()<cr>
nnoremap gd :call OmniSharp#GotoDefinition()<cr>
nnoremap tt :OmniSharpFindType<cr>
nnoremap mm :OmniSharpFindSymbol<cr>
nnoremap <leader>fi :call OmniSharp#FindImplementations()<cr>
nnoremap <leader>fu :call OmniSharp#FindUsages()<cr>
nnoremap <leader>tt :call OmniSharp#TypeLookup()<cr>
nnoremap <leader>rl :call OmniSharp#ReloadSolution()<cr>
nnoremap <leader>b :call OmniSharp#Build()<cr>
nnoremap <leader>ss :call OmniSharp#StartServer()<cr>
"I find contextual code actions so useful that I have it mapped to the spacebar
nnoremap <space> :call OmniSharp#GetCodeActions()<cr>
nnoremap <leader>nm :call OmniSharp#Rename()<cr>
nnoremap rt :OmniSharpRunTests<cr>
nnoremap rf :OmniSharpRunTestFixture<cr>
nnoremap ra :OmniSharpRunAllTests<cr>
nnoremap rl :OmniSharpRunLastTests<cr>

"nnoremap <C-L> :NERDTreeFind<cr>
nnoremap <C-S> :w<cr>
inoremap <C-S> <esc>:w<cr>
let g:OmniSharp_BufWritePreSyntaxCheck = 1
let g:OmniSharp_CursorHoldSyntaxCheck  = 1
"Don't ask to save when changing buffers (ie when jumping to a type definition)
set hidden
set ffs=dos,unix
" Supertab settings
"nnoremap <C-C> :q<cr>
"Super tab settings
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1
"
""don't autoselect first item in omnicomplete, show if only one item (for
set completeopt=longest,menuone,preview
func! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
