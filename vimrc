" as early as possible, as it has side effects.
set nocompatible
set ttyfast
set lazyredraw
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


set background=dark
set termguicolors

syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

set gdefault
set colorcolumn=0
set textwidth=80
set guifont=Hack:h18
set relativenumber
set number
set nowrap
set nocursorline
set vb "No audio bell"
set wildignore+=*.class
set backspace=2   " Backspace deletes like most programs in insert mode
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=75
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set splitbelow
set splitright
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set diffopt+=vertical
set autoread
set ignorecase
set smartcase
set shortmess+=c
set signcolumn=yes " always show signcolumns
set updatetime=100 " For gitgutter to show git markers

filetype plugin indent on

let mapleader=" "

let g:mix_format_on_save = 1


" Treat .sql as .pgsql
let g:sql_type_default = 'pgsql'

au BufLeave,FocusLost,VimResized * :wa

" Allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass setlocal iskeyword+=-

" set filetypes as typescript.jsx
" autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
" autocmd BufNewFile,BufRead *.ts, set filetype=typescript.tsx
autocmd BufNewFile,BufRead *tsx.snap, set filetype=typescript.tsx
autocmd BufNewFile,BufRead *ts.snap, set filetype=typescript.ts
autocmd BufNewFile,BufRead *js.snap, set filetype=typescript.js
autocmd BufNewFile,BufRead *jsx.snap, set filetype=typescript.jsx

" Use Ctrl-j & k to move up and down in coc
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(0) : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(0) : "\<C-k>"

" From https://github.com/neoclide/coc.nvim/pull/3862
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x> coc#pum#visible() ? coc#pum#stop() : "\<C-x>"

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

let g:enable_bold_font = 1
let g:jsx_ext_required = 0
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

nnoremap <leader>m :Emodel<CR>
nnoremap <leader>c :Econtroller<CR>
nnoremap <leader>v :Eview<CR>
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

let test#strategy = "vimux"

let test#elixir#exunit#executable = 'foreman run mix test'
let test#ruby#rspec#executable = './bin/rspec'
let test#javascript#jest#executable = 'yarn test --watchAll=false'

nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

nmap <silent> <leader>j <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>e <Plug>(coc-list-diagnostics)

let g:move_key_modifier = 'A'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap gp <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap gl <Plug>(coc-codeaction)
nmap gd <Plug>(coc-type-definition)
nnoremap <silent> K :call <SID>show_documentation()<CR>

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  " autocmd BufReadPost *
  "       \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  "       \   exe "normal g`\"" |
  "       \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

endif

" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
" Use ctrl-p for fzf
nmap <C-P> :GFiles --cached --others --exclude-standard<CR>
let g:fzf_layout = { 'down': '20%' }

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
" nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
" nnoremap <Leader>s :call RunNearestSpec()<CR>
" nnoremap <Leader>l :call RunLastSpec()<CR>
" nnoremap <Leader>a :call RunAllSpecs()<CR>

let g:rspec_runner = "os_x_iterm2"

" let g:rspec_command = 'call Send_to_Tmux("clear && zeus rspec {spec}\n")'
let g:rspec_command = 'call Send_to_Tmux("clear && bundle exec rspec {spec}\n")'

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

let g:ragtag_global_maps = 1

" Surround to make ERB tags, surroundable
let b:surround_{char2nr('=')} = "<%= \r %>"
let b:surround_{char2nr('-')} = "<% \r %>"

" Always search downwards/upwards
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]


let g:tagalong_filetypes = ['html', 'xml', 'jsx', 'eruby', 'ejs', 'eco', 'php', 'htmldjango', 'tsx', 'typescript.tsx']

" Use AG (silver-searcher) for Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <Leader>s :Ack!<Space>

function! CreateFile(path)
    " Split the path into directory and file parts
    let s:dir = fnamemodify(a:path, ':h')
    " Check if the directory exists, if not create it
    if !isdirectory(s:dir)
        call mkdir(s:dir, 'p')
    endif

    if a:path == ""
      return
    endif

    " Do we already have an extension?
    if match(a:path, '\.') >= 0
      " Open the new file
      exe 'edit ' . a:path
    else
      " Open the new file and append the current file's extension
      exe 'edit ' . a:path . '.' . expand("%:e")
    endif

endfunction

" maps leader o to create a new file in current directory (not the working directory, but the directory of the current file)
nnoremap <leader>o :call CreateFile(input('New file path: ', expand("%:p:h") . "/"))<CR>

" Reload icons after init source
if exists('g:loaded_webdevicons')
  let g:webdevicons_enable_nerdtree = 0
  call webdevicons#refresh()
endif

" Copilot
let g:copilot#enable = 1
inoremap <C-n> <Plug>(copilot-next)
inoremap <C-p> <Plug>(copilot-previous)
