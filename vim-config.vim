set mouse=a
syntax enable
colorscheme gruvbox
set background=dark
set visualbell
set relativenumber
set cursorline
set cursorcolumn

let g:python3_host_prog = '/usr/local/bin/python3'
"let g:python_host_prog = '/Users/damienbry/.pyenv/versions/neovim2/bin/python'
"let g:ruby_host_prog = '/Users/damienbry/.rbenv/shims/neovim-ruby-host'
"let g:node_host_prog = '/Users/damienbry/.nvm/versions/node/v14.8.0/bin/neovim-node-host'

call plug#begin()

Plug 'pangloss/vim-javascript'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Townk/vim-autoclose'
Plug 'bit2pixel/vim-togglemouse'
Plug 'itchyny/lightline.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'morhetz/gruvbox'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'zenbro/mirror.vim'
Plug 'derekwyatt/vim-scala'
Plug 'bkad/CamelCaseMotion'
Plug 'craigemery/vim-autotag'
Plug 'benmills/vimux'
"Plug 'mhinz/vim-startify'
Plug 'amadeus/vim-mjml'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'slim-template/vim-slim'
Plug 'beyondwords/vim-twig'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-endwise'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-abolish'

" fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'kassio/neoterm'

Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Fuzzy completion
Plug 'Shougo/neosnippet'
Plug 'damienbry/vim-snippets'

Plug 'kshenoy/vim-signature'
Plug 'lifepillar/pgsql.vim'
"Plug 'ivalkeen/vim-simpledb'

" post install (yarn install | npm install) then load plugin only for editing supported files
"Plug 'prettier/vim-prettier', {
  "\ 'do': 'yarn install',
  "\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

call plug#end()

au BufNewFile,BufRead *.es6 set ft=javascript "vim-javascript syntax for .es6 files
au BufNewFile,BufRead *.tsx set ft=javascript
au BufNewFile,BufRead *.ts set ft=javascript
au BufNewFile,BufRead *.fish set ft=sh "fish config files

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' "nearest ancestor containing .git folder
let g:ctrlp_switch_buffer = 'et' "opens file in new pane
"custom ctrlp ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "ignore files in .gitignore

map <C-n> :NERDTreeToggle<CR>

set number "show line numbers
set expandtab "converts tabs to spaces
set tabstop=2 "tab => 2 spaces
set shiftwidth=2 "ident => 2 spaces
set list "show tabs character"

augroup python_files
    autocmd!
    autocmd FileType python setlocal noexpandtab
    autocmd FileType python set tabstop=4
    autocmd FileType python set shiftwidth=4
augroup END

"let g:jsx_ext_required = 0 "vim-jsx: jsx format also for .js files

let g:gruvbox_contrast_dark = 'soft'

set hlsearch "highlight matching phrases
set ignorecase "you nearly always want this
set smartcase  "case-sensitive if search contains an uppercase character

autocmd BufWritePre * %s/\s\+$//e "removes trailing whitespaces before saving

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight CursorLine ctermbg=black

" Revert Color to default when leaving Insert Mode
" use :hi to get current scheme colors
autocmd InsertLeave * highlight CursorLine ctermbg=237 guibg=#3c3836

" map control+c to escape
inoremap <C-C> <Esc>

"Paste in visual mode again and again
xnoremap p pgvy

" Set Leader key and use camelCaseMotion default mappings
let mapleader = ','
call camelcasemotion#CreateMotionMappings('<leader>')

autocmd FileType php setlocal shiftwidth=4 tabstop=4 "indent size only for php (my use case)

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

"show the current command being entered
set showcmd

"pgsql select current function
map <Leader>vf ?create .* function<Enter><S-V>/\$\$ language<Enter>"*y``zz:noh<Enter>
"pgsql select current test
map <Leader>vt ?begin;<Enter><S-V>/rollback<Enter>"*y

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" move text and re-highlight
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" search for visually selected text
vnoremap // y/<C-R>"<CR>

" delete attribute
map <Leader>da F d2f"

" add class
map tc vath%<Esc>f>i class=""<Esc>hi

" associate *.mustache with html filetype
augroup filetypedetect
    au BufRead,BufNewFile *.mustache setfiletype html
augroup END

" macros trigger rerender only at the end of their execution
set lazyredraw

" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.mustache,*.md,*.twig'

" markdown bold surround
" I personnaly also mapped OSX Command + B to <C-B> via iTerm2 (using hex code 0x02)
nnoremap <C-b> ciw****<Esc>h<S-P>
vnoremap <C-b> c****<Esc>h<S-P>

" <a href=""></a> helper with visual selection and clipboard url
vnoremap <C-a> c<a href="" target="_blank"></a><Esc>?href=""<CR>5l"*pvit<Esc><S-p>

" emoji helper
" nnoremap <C-I> a<i class="twa twa-"></i><Esc>5hi

" ruby quick log
autocmd FileType ruby nnoremap <C-L> $v0wyip "<Enter><Esc>k$:r ! sh ~/.vim/random_emoji.sh<Enter>kJJ$a #{<Esc>pA}"<Esc>0f"lxf{l
autocmd FileType javascript nnoremap <C-L> $v0wyiconsole.log('<Enter><Esc>k$:r ! sh ~/.vim/random_emoji.sh<Enter>kJJ$a ', <Esc>pA)<Esc>0f"lxf{l

" ruby tap log
" nnoremap <S-T> o.tap{|x| p "🚰 #{x}"}<Esc>

" minimap
let g:minimap_toggle='<C-M>'

" git-gutter
function! GitGutterNextHunkCycle()
  let line = line('.')
  silent! GitGutterNextHunk
  if line('.') == line
    1
    GitGutterNextHunk
  endif
endfunction

nmap gn :call GitGutterNextHunkCycle()<CR>
nmap gN :call GitGutterNextHunkCycle()<CR>

" vim-rails config
let g:rails_projections = {
      \  "app/controllers/*.rb": {
      \      "test": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_spec.rb",
      \        "test/controllers/{}_test.rb"
      \      ],
      \      "alternate": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_spec.rb",
      \        "test/controllers/{}_test.rb"
      \      ],
      \   },
      \  "app/javascript/*.js": {
      \      "test": [
      \        "spec/javascript/{}.spec.js",
      \      ],
      \      "alternate": [
      \        "spec/javascript/{}.spec.js",
      \      ],
      \   },
      \   "spec/requests/*_spec.rb": {
      \      "command": "request",
      \      "alternate": "app/controllers/{}.rb",
      \      "template": [
      \        "# frozen_string_literal: true",
      \        "",
      \        "require 'rails_helper'",
      \        "",
      \        "describe {camelcase|capitalize|colons} do",
      \        "end"
      \      ]
      \   },
      \ }
" shortcut to launch rspec/jest
command Test :Runner
command Tes :Runner
command Run :Runner

" load ctags for files
autocmd FileType ruby set tags=./ruby_tags,ruby_tags;./tags,tags;
autocmd FileType javascript set tags=./js_tags,js_tags;./tags,tags;

"neoterm
"let g:neoterm_shell = '/usr/local/bin/fish'
let g:neoterm_default_mod = 'vertical'
let g:neoterm_term_per_tab = 1 " Different terminal for each tab
let g:neoterm_auto_repl_cmd = 0 " Do not launch rails console on TREPLsend

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Deoplete (required for NeoSnippets)
let g:deoplete#enable_at_startup=1

" NeoSnippets
let g:neosnippet#snippets_directory = "/Users/damienbry/.config/nvim/plugged/vim-snippets/neosnippets/"

imap <C-e>     <Plug>(neosnippet_expand_or_jump)
smap <C-e>     <Plug>(neosnippet_expand_or_jump)
xmap <C-e>     <Plug>(neosnippet_expand_target)

imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Keep window centered when searching
nnoremap n nzz
nnoremap N Nzz

" syntax .sql files
let g:sql_type_default = 'pgsql'

" disable TSX support for jsx-pretty, we use another plugin for that (vim-jsx-typescript)
let g:vim_jsx_pretty_disable_tsx = 1

" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Prettier config
"let g:prettier#autoformat = 1
"let g:prettier#autoformat_require_pragma = 0

" surround node if
nnoremap <C-i> 0Cif() {<Enter><Esc>Po}<Esc>?if() {<Enter>2la
