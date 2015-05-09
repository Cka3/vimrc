set nocompatible              " be iMproved, required
filetype off                  " required

"--------------------------------------------------
" Plugin Manager

" set the runtime path to include Vundle and initialize
if has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    let path='~/vimfiles/bundle'
    call vundle#begin(path)
else
  if has("unix")
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
  endif
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"--------------------------------------------------
""Plugins""
" Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/neocomplete.vim'
"Plugin for javascript
" Plugin 'marijnh/tern_for_vim'
" Plugin 'jelera/vim-javascript-syntax'

" Snippets engine with good integration with neocomplcache
" Plugin 'Shougo/neosnippet'

" Default snippets
" Plugin 'honza/vim-snippets'

" Allow autoclose paired characters like [,] or (,), and add smart cursor positioning inside it,
"Plugin 'Raimondi/delimitMate'

" Great file system explorer, it appears when you open dir in vim
" Allow modification of dir, and may other things
Plugin 'scrooloose/nerdtree'

" Easymotion plugin for fast navigation
Plugin 'Lokaltog/vim-easymotion'

" Add smart commands for comments like:
" gcc - Toggle comment for the current line
" gc  - Toggle comments for selected region or number of strings
" Very usefull
Plugin 'tomtom/tcomment_vim'

" Best git wrapper for vim
" But with my workflow, i really rarely use it
" just Gdiff and Gblame sometimes
Plugin 'tpope/vim-fugitive'

" Fix-up dot command behavior
" it's kind of service plugin
Plugin 'tpope/vim-repeat'

" Add usefull hotkey for operation with surroundings
" cs( what ){towhat} - inside '' or [] or something like this allow
" change surroundings symbols to another
" and ds{what} - remove them
Plugin 'tpope/vim-surround'

" Highlights the matching HTML tag when the cursor
" is positioned on a tag.
Plugin 'gregsexton/MatchTag'

" Add Support css3 property
Plugin 'hail2u/vim-css3-syntax'

" Plugin for changing cursor when entering in insert mode
" looks like it works fine with iTerm Konsole adn xerm and windows
Plugin 'jszakmeister/vim-togglecursor'


" Nice statusline/ruler for vim
Plugin 'bling/vim-airline'

"Monokai Colors
Plugin 'lsdr/monokai'

" Most recent files source for unite
" Plugin 'Shougo/neomru.vim'

" Plugin lazy file search
Plugin 'kien/ctrlp.vim'

" Plugin for chord mappings
Plugin 'kana/vim-arpeggio'

"--------------------"Clojure Plugins----------------------
Plugin 'guns/vim-clojure-static'

Plugin 'kien/rainbow_parentheses.vim'

Plugin 'vim-scripts/paredit.vim'

"Plugin 'jpalardy/vim-slime'

Plugin 'tpope/vim-fireplace'

Plugin 'tpope/vim-classpath'

" All of your Plugins must be added before the following line
"-------------------"End of plugins section"----------------
call vundle#end()            " required
filetype plugin indent on    " required

"-------------------"Setting up clojure staff"---------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces"
"------------------------------------------------------------



"-------------------------------------------------
" DelimitMate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1

"--------------------------------------------------
" NERDTree

" Tell NERDTree to display hidden files on startup
let NERDTreeShowHidden=1

" Disable bookmarks label, and hint about '?'
let NERDTreeMinimalUI=1

" Display current file in the NERDTree ont the left
nmap <silent> <leader>= :NERDTreeFind<CR>
"---------------------------------------------------
" Fugitive

" Blame on current line
nmap <silent> <leader>b :.Gblame<cr>
" Blame on all selected lines in visual mode
vmap <silent> <leader>b :Gblame<cr>
" Git status
nmap <silent> <leader>gst :Gstatus<cr>
" like git add
nmap <silent> <leader>gw :Gwrite<cr>
" git diff
nmap <silent> <leader>gd :Gdiff<cr>
" git commit
nmap <silent> <leader>gc :Gcommit<cr>
" git commit all
nmap <silent> <leader>gca :Gcommit -a<cr>
" git fixup previous commit
nmap <silent> <leader>gcf :Gcommit -a --amend<cr>
"--------------------------------------------------
" General options

" Enable per-directory .vimrc files and disable unsafe commands in them
"set exrc secure

" Set up leader key <leader>, i use default \
"let mapleader = ','

" Buffer will be hidden instead of closed when no one display it
"set hidden

" Auto reload changed files
set autoread

" Always change current dirrectory to current-editing-file dir
set autochdir

" Indicates fast terminal connection
set ttyfast

" Set character encoding to use in vim
"set encoding=windows-1251

" Let vim know what encoding we use in our terminal
set termencoding=windows-1251

" Which EOl used. For us it's unix
" Not works with modifiable=no
if &modifiable
    set fileformat=unix
endif

" Use 256 colors in vim
" vim-airline not work without it
set t_Co=256

" Enable Tcl interface. Not shure what is exactly mean.
" set infercase

" Interprete all files like binary and disable many features.
" set binary

"--------------------------------------------------
" Display options
if has('gui_running')
    colorscheme monokai 
    let g:rehash256 = 1
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
else
endif



" Hide showmode
" Showmode is useless with airline
set noshowmode

" Show file name in window title
set title

" Mute error bell
set novisualbell

" Remove all useless messages like intro screen and use abbreviation like RO
" instead readonly and + instead modified
set shortmess=atI

" Enable display whitespace characters
set list

" Setting up how to display whitespace characters
"set listchars=tab:\ ,trail:Â·,extends:â‹¯,precedes:â‹¯,nbsp:~

" Wrap line only on characters in breakat list like ^I!@*-+;:,./?
" Useless with nowrap
" set linebreak

" Numbers of line to scroll when the cursor get off the screen
" Useless with scrolloff
" set scrolljump=5

" Numbers of columns to scroll when the cursor get off the screen
" Useless with sidescrollof
" set sidescroll=4

" Numbers of rows to keep to the left and to the right off the screen
set scrolloff=10

" Numbers of columns to keep to the left and to the right off the screen
set sidescrolloff=10

" Vim will move to the previous/next line after reaching first/last char in
" the line with this commnad (you can add 'h' or 'l' here as well)
" <,> stand for arrows in command mode and [,] arrows in visual mode
set whichwrap=b,s,<,>,[,],

" Display command which you typing and other command related stuff
set showcmd

" Indicate that last window have a statusline too
set laststatus=2

" Add a line / column display in the bottom right-hand section of the screen.
" Not needed with airline plugin
"set ruler

" Setting up right-hand section(ruller) format
" Not needed with airline plugin
"set rulerformat=%30(%=\:%y%m%r%w\ %l,%c%V\ %P%)

" The cursor should stay where you leave it, instead of moving to the first non
" blank of the line
set nostartofline

" Disable wrapping long string
set nowrap

" Display Line numbers
set number

" Highlight line with cursor
set cursorline

" maximum text length at 80 symbols, vim automatically breaks longer lines
set textwidth=80

" higlight column right after max textwidth
set colorcolumn=+1


"--------------------------------------------------
" Tab options

" Copy indent from previous line
set autoindent

" Enable smart indent. it add additional indents when necessary
set smartindent

" Replace tabs with spaces
set expandtab

" Whe you hit tab at start of line, indent added according to shiftwidth value
set smarttab

" number of spaces to use for each step of indent
set shiftwidth=4

" Number of spaces that a Tab in the file counts for
set tabstop=4

" Same but for editing operation (not shure what exactly does it means)
" but in most cases tabstop and softtabstop better be the same
set softtabstop=4

" Round indent to multiple of 'shiftwidth'.
" Indentation always be multiple of shiftwidth
" Applies to  < and > command
set shiftround

"--------------------------------------------------
" Search options

" Add the g flag to search/replace by default
set gdefault

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search patter ncontains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Disable higlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Show matching brackets
set showmatch

" Make < and > match as well
set matchpairs+=<:>


"--------------------------------------------------
" Wildmenu

" Extended autocmpletion for commands
set wildmenu

" Autocmpletion hotkey
set wildcharm=<TAB>

"--------------------------------------------------
" Folding

" Enable syntax folding in javascript
let javaScript_fold=1

" No fold closed at open file
set foldlevelstart=99
set nofoldenable
syntax on

" Keymap to toggle folds with space
nmap <space> za

""-------------------------------------------------
" Vim-airline

" Colorscheme for airline
let g:airline_theme='understated'

" Set custom left separator
let g:airline_left_sep = '|'

" Set custom right separator
let g:airline_right_sep = '|'

" Enable airline for tab-bar
let g:airline#extensions#tabline#enabled = 1

" Don't display buffers in tab-bar with single tab
let g:airline#extensions#tabline#show_buffers = 0

" Display only filename in tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't display encoding
let g:airline_section_y = ''

" Don't display filetype
let g:airline_section_x = ''

"----------------------------------------------------
"NeoSnippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"----------------neocomplite-----------------
let g:neocomplete#enable_at_startup = 1
"-------------------------
"Add new neosnippets
" let g:neosnippet#snippets_directory='~/vimfiles/bundle/vim-snippets/snippets'

" Smart tab Behavior
function! CleverTab()
    " If autocomplete window visible then select next item in there
    if pumvisible()
        return "\<C-n>"
    endif
    " If it's begining of the string then return just tab pressed
    let substr = strpart(getline('.'), 0, col('.') - 1)
    let substr = matchstr(substr, '[^ \t]*$')
    if strlen(substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        " If not begining of the string, and autocomplete popup is not visible
        " Open this popup
        return "\<C-x>\<C-u>"
    endif
endfunction
inoremap <expr><TAB> CleverTab()

" Undo autocomplete
inoremap <expr><C-e> neocomplcache#undo_completion()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" For cursor moving in insert mode
" inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
" inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
" inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
" inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

" disable preview in code complete
set completeopt-=preview

"-------------------------
" Arpeggio

" map jk to escape
call arpeggio#map('i', '', 0, 'jk', '<ESC>')

"--------------------------------------------------
"--------------------------------------------------
" Edit

" Allow backspace to remove indents, newlines and old text
set backspace=indent,eol,start

" toggle paste mode on \p
set pastetoggle=<leader>p

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" Disable backups file
set nobackup

" Disable vim common sequense for saving.
" By defalut vim write buffer to a new file, then delete original file
" then rename the new file.
set nowritebackup

" Disable swp files
set noswapfile

" Do not add eol at the end of file.
set noeol

"--------------------------------------------------
" Diff Options

" Display filler
set diffopt=filler

" Open diff in horizontal buffer
set diffopt+=horizontal

" Ignore changes in whitespaces characters
set diffopt+=iwhite


"--------------------------------------------------
" My FUnctions and other settings

" Automatically use absolute line numbers when we’re in insert mode and relative numbers when we’re in normal mode:
autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Automatically switch to absolute line numbers whenever Vim loses focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber

"--------------------------------------------------
" Hotkeys

" Open new tab
nmap <silent><leader>to :tabnew .<CR>

" Replace
nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>

" Moving between splits
nmap <leader>w <C-w>w

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

" Fast quit 
nmap <leader>] :wq <CR> 

" Open my .vimrc for editing
nmap <leader>m :e $MYVIMRC <CR> 

"togle line numbers (relative|normal)
"nnoremap <C-n> :call NumberToggle()<cr>
nnoremap <silent><leader>n :set relativenumber!<cr>
"--------------------------------------------------
