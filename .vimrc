if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'featurist/vim-pogoscript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'nosami/Omnisharp'
NeoBundle 'nosami/molokai'
NeoBundle 'nosami/tslime.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-vinegar'


let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
filetype plugin on
filetype indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set guifont=Consolas:h11:cANSI
set guioptions+=LlRrbmT
set guioptions-=LlRrbmT
set encoding=utf-8
set laststatus=2
" disable beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd!
	autocmd GUIEnter * set visualbell t_vb=
endif
syntax on
let g:airline_powerline_fonts = 1
set noswapfile
set number
set hidden
set cursorline
set mouse=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
set autoindent
set si
set history=1000
set expandtab
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
set makeprg=build
set errorformat=\ %#%f(%l\\\,%c):\ %m
set nofoldenable
"use insert cursor when in insert mode in terminal
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
if exists('$TMUX')
  let &t_SI = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[0 q"
endif
let mapleader=" "

"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

let g:OmniSharp_timeout = 10
"Set the type lookup function to use the preview window instead of the status line
let g:OmniSharp_typeLookupInPreview = 0
"load code documentation at bottom of the screen instead of top
set splitbelow 
inoremap jk <esc>
inoremap kj <esc>
inoremap <C-a> <esc>
vnoremap <C-a> <esc>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
"yank and put keep cursor at the bottom of the selection on completion
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" copy and paste from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nnoremap <leader>1 :diffget //2<cr>
nnoremap <leader>2 :Gwrite!<cr>:wq!<cr>
nnoremap <leader>3 :diffget //3<cr>

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

let g:agprg="ag --column --ignore-dir=bower_components --ignore-dir=common/js --ignore-dir=imd_system --ignore-dir=quack_template"
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab


" OmniSharp
inoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
nnoremap <leader>a :Ag<cword><cr>
" Builds can run asynchronously with vim-dispatch installed
nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
nnoremap <C-b> :wa!<cr>:OmniSharpBuildAsync<cr>

"The following commands are contextual, based on the current cursor position.

nnoremap <F12> :OmniSharpGotoDefinition<cr>
nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
nnoremap <leader>fm :OmniSharpFindMembersInBuffer<cr>
nnoremap <leader>x  :OmniSharpFixIssue<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>dc :OmniSharpDocumentation<cr>

"show type information automatically when the cursor stops moving
autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
let g:syntastic_cs_checkers = ['syntax', 'issues']
"autocmd CursorHold *.cs call OmniSharp#GetIssues()
set updatetime=300
set cmdheight=2
"I find contextual code actions so useful that I have it mapped to the spacebar
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
vnoremap <leader><space> :call OmniSharp#GetCodeActions()<cr>
" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>      
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
command! -nargs=1 R :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" Automatically add new cs files to the nearest project on save
autocmd BufWritePost *.cs call OmniSharp#AddToProject()
" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
nnoremap <leader>rt :OmniSharpRunTests<cr>
nnoremap <leader>rf :OmniSharpRunTestFixture<cr>
nnoremap <leader>ra :OmniSharpRunAllTests<cr>
nnoremap <leader>rl :OmniSharpRunLastTests<cr>

nnoremap <C-S> :w<cr>
inoremap <C-S> <esc>:w<cr>
nnoremap <Leader>w :w<CR>
"let g:OmniSharp_BufWritePreSyntaxCheck = 1
"let g:OmniSharp_CursorHoldSyntaxCheck  = 1
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

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Don't Use smartcase.
let g:neocomplete#enable_smart_case = 0
let g:neocomplete#enable_auto_close_preview = 0
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
        \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

let g:neocomplete#enable_auto_select = 0
let g:neocomplete#disable_auto_complete = 0

" Enable heavy omni completion.

call neocomplete#custom#source('_', 'sorters', [])

if !exists('g:neocomplete#sources')
        let g:neocomplete#sources = {}
endif

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
let g:neocomplete#sources.cs = ['omni']
let g:neocomplete#enable_refresh_always = 0
let g:echodoc_enable_at_startup = 1
"let g:neocomplete#enable_insert_char_pre = 1

"neocomplete settings for obj c
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
"let g:clang_use_library = 1
