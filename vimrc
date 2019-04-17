" as early as possible, as it has side effects.
set nocompatible
set ttyfast
set lazyredraw

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

augroup nord
    autocmd ColorScheme nord highlight MatchParen ctermbg=0 ctermfg=3
augroup end

colorscheme nord

set gdefault
set re=1
set termguicolors
set colorcolumn=0
set textwidth=80
set guifont=Hack:h16
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

filetype plugin indent on

let mapleader=" "
let g:deoplete#auto_complete_delay=0
let g:deoplete#auto_refresh_delay=100
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

let g:mix_format_on_save = 1

let g:SimpleSnippets_dont_remap_tab = 1

let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

au BufLeave,FocusLost,VimResized * :wa

" Allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass setlocal iskeyword+=-

" set filetypes as typescript.jsx
" autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
" autocmd BufNewFile,BufRead *.ts, set filetype=typescript.tsx

" Use Ctrl-j & k to move up and down in deoplete
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" Tab to move in deoplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

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

nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

" nmap <silent> <leader>j <Plug>(ale_previous_wrap)
" nmap <silent> <leader>k <Plug>(ale_next_wrap)

let g:move_key_modifier = 'A'

" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync
"
" Fix files with prettier then eslint
" let g:ale_fixers = {'typescript': ['prettier', 'tslint'],'javascript': ['prettier', 'eslint']}
" let g:ale_fix_on_save = 1
" let g:ale_sign_column_always = 1
" let g:ale_completion_enabled = 1
" let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

let g:used_javascript_libs = 'react,angular'
 
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

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_working_path_mode = '0'

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

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
let g:rspec_command = 'call Send_to_Tmux("clear && spring rspec {spec}\n")'

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

" Ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

" Surround to make ERB tags, surroundable
let b:surround_{char2nr('=')} = "<%= \r %>"
let b:surround_{char2nr('-')} = "<% \r %>"

" let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_section_b = ''
" let g:airline_section_z = ''
" let g:airline_section_y = ''
" let g:airline_section_x = ''
" let g:airline_theme = "hybrid"
