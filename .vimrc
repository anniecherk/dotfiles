"Turn on autoindent
set autoindent
"Expand tabs to spaces
set expandtab
"Expand tabs to 4 spaces
set shiftwidth=4
set tabstop=4
"Delete 4 spaces if press backspace at the beginning of a line
set softtabstop=4

"Turn on line numbers
set number

"Turn on syntax highlighting
syntax on

"Always show the cursor
set ruler 

"Ignore case during a search
set ignorecase
"Enable incremental search
set incsearch
"Case sensative if there is an upper case letter in the search string
set smartcase
"Highlight search results
set hlsearch
"Make Clear be a command to clear the search string
command Clear let @/=""

"Set jj to escape from insert mode.
inoremap jj <Esc>
"nn to replicate the effect in Colemak.
inoremap nn <Esc>

"Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
