" download vim-plug if missing
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    silent! execute '!curl -fsSLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * silent! PlugInstall
endif

silent! if plug#begin('~/.local/share/nvim/plugged')

    Plug 'jalvesaq/Nvim-R'
    Plug 'lervag/vimtex'
    Plug 'honza/vim-snippets'
    Plug 'powerline/powerline'
    Plug 'tpope/vim-git'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'aperezdc/vim-template'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'wesQ3/vim-windowswap'
    Plug 'Shougo/deoplete.nvim'
    Plug 'vim-airline/vim-airline'

    function! BuildComposer(info)
      if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
          !cargo build --release
        else
          !cargo build --release --no-default-features --features json-rpc
        endif
      endif
    endfunction 
    Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

  call plug#end()
endif

let maplocalleader = ","

" line number
set number
set relativenumber

" mouse for resizing windows
" using mouse: https://neovim.io/doc/user/options.html#'mouse'
" resizing: https://neovim.io/doc/user/windows.html#window-resize
set mouse=a

" kill buffer without closing split
cmap bk :bp<bar>bd#<CR>

" key mappings
map <F7> :tabn<cr>
map <F8> :tabp<cr>
imap jk <esc>

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" Better copy & paste
set clipboard+=unnamedplus
cabbrev h vert bo h

" change current directory to buffer directory
autocmd BufEnter * silent! lcd %:p:h

" let g:airline_powerline_fonts = 1

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" spell check on
set spelllang=en
map <F5> :setlocal spell! spelllang=en_us<CR>

"set t_Co=16
"colorscheme butter

""""""""""""""""""""
"" vimtex settings
""
" remove visible text formatting: https://github.com/lervag/vimtex/issues/478 
let g:tex_conceal = ""
"let g:tex_flavor = 'latex'
"let g:Tex_Folding = 0
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:vimtex_quickfix_latexlog = {'fix_paths':0}

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
set runtimepath+=~/Dropbox/sync
let g:UltiSnipsSnippetsDir="~/Dropbox/sync/snippets-vim/"
let g:UltiSnipsSnippetDirectories=["snippets-vim", "UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

augroup latexSurround
    autocmd!
    autocmd FileType tex call s:latexSurround()
augroup END

function! s:latexSurround()
    let b:surround_{char2nr("e")}
                \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
    let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction


""""""""""""""""""""
"" Nvim-R settings
""
syntax enable
filetype plugin on
filetype indent on

let R_openpdf = 1
let R_openhtml = 1
let R_args = ['--no-save', '--quiet']
let R_nvimpager = 'tab'

map <silent> <LocalLeader>ki :call RMakeRmd("ioslides_presentation")<CR>
map <silent> <LocalLeader>ks :call RMakeRmd("slidy_presentation")<CR>

"nmap <LocalLeader>kt <Plug>RBibTeXK
"imap <LocalLeader>kt <Plug>RBibTeXK
"vmap <LocalLeader>kt <Plug>RBibTeXK

" folding
let r_syntax_folding = 1
autocmd FileType r setlocal foldnestmax=1
autocmd FileType r setlocal foldopen-=block
autocmd FileType r hi Folded ctermbg = none

""""""""""""""""""""
"" remove trailing white spaces
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

noremap <leader>w :call DeleteTrailingWS()<CR>

""""""""""""""""""""
"" vim-template
let g:user = "Sang-Yun Oh"                                         
let g:email = "syoh@ucsb.edu"

let g:templates_no_autocmd = 1
let g:templates_no_builtin_templates = 1
let g:templates_directory = "/home/syoh/Dropbox/sync/templates-vim"


""""""""""""""""""""
"" vim-markdown
autocmd FileType pandoc set conceallevel=0
autocmd FileType pandoc normal zR


"" yaml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

""""""""""""""""""""
"" completion 
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
