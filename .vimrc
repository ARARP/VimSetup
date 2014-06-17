"colors
if $COLORTERM == 'gnome-terminal'
     set t_Co=256
endif

" global config
syntax on
set incsearch
set hlsearch
set number
set ruler
set noswapfile 

"coding format conventions
set expandtab
set cindent 
set tabstop=3
set shiftwidth=3
"set colorcolumn=86
highlight ColorColumn ctermbg=7

set ttyfast
set ttymouse=xterm2
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
autocmd! bufwritepost .vimrc source %

"set mouse=n 
filetype off
filetype plugin on
filetype plugin indent on

"tracking recent changes.
set history=1000
set undolevels=1000

let mapleader=","

" global config end

"pathogen settings
execute pathogen#infect()

" just some colors for tin/tac, totally messed up colors but colors
au BufNewFile,BufRead *.tac set filetype=c
au BufNewFile,BufRead *.tin set filetype=c

"powerline - powerline disabled - not good enough colors
"set laststatus=2

"ctrlp - fuzzy file search
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 10
set wildignore+=*.pyc

"cscope settings
set cspc=6
set csverb

" Python folding
" wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Jedi plugin 
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>j"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
map <Leader>b Oimport pdb; pdb.set_trace() # BREAKPOINT<C-c>

" Ctrl-p file finder
let g:ctrlp_max_depth = 1
let g:ctrlp_max_depth = 1
let g:ctrlp_user_command = 'find %s -type f' 

" See  http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
   if pumvisible()
      if a:action == 'j'
         return "\<C-N>"
      elseif a:action == 'k'
         return "\<C-P>"
      endif
   endif
   return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


"pyflakes settings


"minibuf setting
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow = 1


"highlight SpellBad term=reverse ctermbg=1
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

if has("gui_running") 
   highlight SpellBad term=underline gui=undercurl guisp=White 
endif 
"set tags=./bin/ctags
set hid

" -------------------------------
" No config below this line
" -------------------------------
"lazy hands.. 

"gundo mapping
nnoremap <F5> :GundoToggle<CR>

imap ff <ESC>
nmap ;; :
map ffl <C-l>
map ffh <C-h>
map ffj <c-j>
map ffk <c-k>
map ffn  :Tlist <CR>
map ffv  :vsp  <CR>
map ffq  :q    <CR>
map ffw  :w    <CR>

"map for cscope finds
nmap ffs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap ffg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap ffc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap fft :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ffe :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap fff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap ffi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap ffd :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap ff2 :set colorcolumn=200 <cr>
nmap ff1 :set colorcolumn=86 <cr>
nmap <C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>

"map <C-T>  :Tlist <CR>
map <C-b>  :TMiniBufExplorer<CR>
map ffb  :TMiniBufExplorer<CR>


function! WWW()
python << endPython
from __future__ import print_function
import vim


with open( "/home/apunj/code/projects/Notes.txt", "a") as fp:
   tt=vim.eval('expand("%:p")')
   fp.write(">>>>\n")
   if ( tt is not None ) :
      fp.write(tt)
      fp.write("\n")
   #tt=vim.eval('expand("<cword>")')
   fp.write( vim.current.line )
   fp.write("\n")
fp.close()

endPython
endfunction


"""""""""""""""
"" commands commands I forget
" vi help
" :%s/stoken/rtoken/g
" http://vim.wikia.com/wiki/Search_and_replace
" :1.5%s/\s/      /g
" :%le - to get rid of spaces at the beginning of a line.
" :scriptname
"
" cs show -> show cs connections
" cs kill -> kill a given connection
" cs reset -> reinit all the connections
"
" pydiction
" whenever any new module is added run pydiction.py to add it to the database
" Check if you need to do a4 chroot -i to access
"
"zf#j creates a fold from the cursor down # lines.
"zf/string creates a fold from the cursor to string .
"zM closes all open folds.
"zR decreases the foldlevel to zero -- all folds will be open.
"zd deletes the fold at the cursor.
"zE deletes all folds.
