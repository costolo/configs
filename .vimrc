" syntax highlighting
autocmd BufNewFile,BufReadPost *.jade set filetype=pug
autocmd BufNewFile,BufReadPost *.pug set filetype=pug

" prettier formatting
autocmd FileType javascript set formatprg=prettier\ --stdin

syntax enable
set autoread
set rtp+=~/.vim/bundle/Vundle.vim
set backspace=indent,eol,start
set mouse=a
set laststatus=2
set statusline=%f "tail of the filename"
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
set background=dark

" plugin settings
let g:syntastic_javascript_checkers=['standard']
" let g:syntastic_javascript_standard_exec = 'semistandard'
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/snippets.json')), "\n"))
let g:delimitMate_expand_cr = 1
let g:NERDSpaceDelims = 1
let g:vim_jsx_pretty_colorful_config = 1
let g:jsx_ext_required = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

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
Plugin 'MaxMEllon/vim-jsx-pretty'
" Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
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

