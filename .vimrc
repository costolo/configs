" options

syntax enable
set nocompatible
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=$TMPDIR//
set directory=$TMPDIR//
set expandtab 
set ignorecase
set laststatus=2
set mouse=a
set number
set rtp+=~/.vim/bundle/vundle.vim
set shiftwidth=2 
set showmatch
set smartcase
set smarttab 
set softtabstop=0 
set statusline=%f "tail of the filename"
set statusline+=%#warningmsg#
set statusline+=%*
set tabstop=8 
set timeoutlen=200

" plugin settings

" TODO figure out what the fuck this snippet was
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/snippets.json')), "\n"))
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:delimitMate_expand_cr = 2
let g:jsx_ext_required = 0
let g:NERDSpaceDelims = 1
let g:vim_jsx_pretty_colorful_config = 1
let g:user_emmet_settings = {
\  'javascript' : {
\    'extends' : 'jsx',
\  },
\}

" custom binds

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
" space + q to write and quit
nnoremap <Leader>q :wq<CR>
" space + Y to copy contents of file
nnoremap <Leader>Y :%y+<CR>
" globally replace double quotes with single quotes
nnoremap <Leader>' :%s/"/'/g<CR>
" remap normal mode paste to paste w/ proper indentation
nnoremap p p=`]
nnoremap <c-p> p
" space + left or right jumps to corresponding EOL or BOL
" inoremap <Leader><Right> <C-o>$
" inoremap <Leader><Left> <C-o>0
" fix indentation across entire file
nmap <C-f> gg=G''
" emmet 
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" nerdtreetoggle binding
map <C-g> :NERDTreeToggle<CR>
vnoremap // y/<C-R>"<CR>"
vmap <Leader>y "+y"
inoremap <Leader><Leader> <C-o>$

" plugins

filetype off

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'justinmk/vim-sneak'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround.git'
Plugin 'digitaltoad/vim-pug'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-scripts/WebAPI.vim'
Plugin 'Valloric/MatchTagAlways'
<<<<<<< HEAD
=======
Plugin 'StanAngeloff/php.vim'
>>>>>>> 8f3cee913dfa67d23c7bde57df1e42cbe59d5f09
Plugin 'tikhomirov/vim-glsl'
call vundle#end()            " required

" turn on filetype, plugin, and indent after vundle runs
filetype plugin indent on

" syntax highlighting for jsx, jade, and pug
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufReadPost *.jade set filetype=pug
autocmd BufNewFile,BufReadPost *.pug set filetype=pug

<<<<<<< HEAD
" 4 space tabs for various filetypes
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype glsl setlocal ts=4 sts=4 sw=4

" Always paste in paste mode
=======
" four spaces for tabs in php and python files
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype glsl setlocal ts=4 sts=4 sw=4
>>>>>>> 8f3cee913dfa67d23c7bde57df1e42cbe59d5f09

" Always paste in paste mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
