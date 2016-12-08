syntax enable
set autoread
set rtp+=~/.vim/bundle/Vundle.vim
set backspace=indent,eol,start
set mouse=a
set pastetoggle=<f10>
set laststatus=2
set statusline=%f "tail of the filename"
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
set background=dark

let g:syntastic_javascript_checkers = ['standard']
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/snippets.json')), "\n"))
let g:delimitMate_expand_cr = 1

" custom binds
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
" space + q to write and quit
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>Y :%y+<CR>
" globally replace double quotes with single quotes
nnoremap <Leader>' :%s/"/'/g<CR>
" remap normal mode paste to paste w/ proper indentation
nnoremap p p=`]
nnoremap <c-p> p
" space + left or right jumps to corresponding EOL or BOL
inoremap <Leader><Right> <C-o>$
inoremap <Leader><Left> <C-o>0
" fix indentation across entire file
nmap <C-f> gg=G''
" emmet 
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" nerdtreetoggle binding
map <C-g> :NERDTreeToggle<CR>
vnoremap // y/<C-R>"<CR>"
vmap <Leader>y "+y"

filetype plugin indent on    " required

" install vundle from https://github.com/VundleVim/Vundle.vim
" set the runtime path to include Vundle and initialize
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'delimitMate.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

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

