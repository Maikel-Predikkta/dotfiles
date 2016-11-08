set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

nmap <S-CR> :w<CR>
imap <S-CR> <ESC>

command -range=% -nargs=* Tidy <line1>,<line2>!
    \perltidy


"run :Tidy on entire buffer and return cursor to (approximate) original position"
fun DoTidy()
    let Pos = line2byte( line( "." ) )
    :Tidy
    exe "goto " . Pos
endfun

"shortcut for normal mode to run on entire buffer then return to current line"
au Filetype perl nmap <F2> :call DoTidy()<CR>

"Always start at the first line of a Git commit message
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

