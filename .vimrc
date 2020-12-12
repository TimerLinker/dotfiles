"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set number
set ignorecase
set ai
set ruler
set title
set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)
set showmatch
set matchtime=2
set ignorecase smartcase
set hlsearch
set incsearch
set si
set backspace=indent,eol,start
set autoread
set tabstop=2
set shiftwidth=2
set expandtab
set lcs=tab:>-,trail:-
set list
set listchars=tab:>-,trail:-
set cursorline
syntax enable
syntax on
set t_Co=256
set fencs=utf8,gb18030,gbk,gb2312,ucs-bom
set encoding=utf-8
set termencoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,chinese
set langmenu=zh_CN.utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'bbchung/clighter8'
call vundle#end()

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai
let g:airline_theme='molokai'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clighter8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clighter8_libclang_path = "/home/ro_dev/.vim/bundle/clighter8/libclang.so"
let g:clighter8_highlight_whitelist = ['clighter8EnumConstantDecl', 'clighter8TypeRef', 'clighter8NamespaceRef']
let g:clighter8_global_compile_args = ['-x', 'c++', '-std=gnu++14']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" special char complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

:inoremap if<space> if ()<CR>{<CR>}<ESC>kk$i
:inoremap for<space> for ()<CR>{<CR>}<ESC>kk$i
:inoremap {<CR> {<CR>}<ESC>O
:inoremap jj <ESC>jo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" short key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F1> :DoxAuthor<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <silent> <space>h :A<CR>
nnoremap <silent> <space>f :CtrlP<CR>
nnoremap <silent> gd :YcmCompleter GoToDefinition<CR>
nnoremap <silent> gr :YcmCompleter GoToReferences<CR>
map <C-\> \c<Space><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ycm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_clangd_binary_path = "/usr/local/bin/clangd"
let g:ycm_clangd_args = ["-limit-results=1000", "-header-insertion=never"]
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '✹'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.','re![_a-zA-z0-9]'],
            \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
            \             're!\[.*\]\s'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" doxygen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"doxygen toolkit-
"let g:DoxygenToolkit_briefTag_pre="@synopsis  "
"let g:DoxygenToolkit_paramTag_pre="@param "
"let g:DoxygenToolkit_returnTag="@returns   "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
"let g:DoxygenToolkit_authorName="Drunkedcat"
"let g:DoxygenToolkit_licenseTag="GPL 2.0"

let g:DoxygenToolkit_authorName="sunhuiwei, sunhuiwei@xindong.com"
"let s:licenseTag = "Copyright(C)\<enter>"
"let s:licenseTag = s:licenseTag . "For free\<enter>"
"let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
"let g:DoxygenToolkit_licenseTag = s:licenseTag
"let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_mpa = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_custom_ignore = '.py$\|.out$\|findexp\|newaddformat\|restart\|protobuf\|.md$\|iconvall\|ciformat\|format\|iconv\|.sh$\|.xml$\|touchAll\|tags\|\.o$\|.d$\|.php$\|.dist$\|.html$'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto code format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FormatOnSave()
  let l:formatdiff = 1
  py3f /home/ro_dev/.tool/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call FormatOnSave()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight txt file with lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! BufNewFile,BufRead *.txt set filetype=lua
