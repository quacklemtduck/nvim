filetype plugin on
set number relativenumber
set smartindent
syntax on
syntax enable
set shiftwidth=4

call plug#begin()
Plug 'drewtempelmeyer/palenight.vim'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

Plug 'dense-analysis/ale'

Plug 'preservim/nerdtree'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

Plug 'Omnisharp/omnisharp-vim'
Plug 'ionide/Ionide-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1

let g:airline_powerline_fonts = 0
let g:airline_theme = 'palenight'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

map <F5> :NERDTreeToggle<CR>

set background=dark
colorscheme palenight

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set mouse=a

set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" Coc configs
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

set clipboard=unnamed
