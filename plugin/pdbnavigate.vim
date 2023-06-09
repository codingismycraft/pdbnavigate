" Title:        pdbnavigate Pluggin                                             
" Description:  A plugin for python debugging using vim and pdb

nnoremap <SPACE> <Nop>

if exists("g:pdb_navigate_plugin")
    finish
endif

let g:pdb_navigate_plugin = 1 

autocmd Bufleave * call pdbnavigate#ResetCursor()

nmap <C-F8> <Esc>:call pdbnavigate#AddToDebug()<CR>                         
nmap <C-F7> <Esc>:call pdbnavigate#ClearDebug()<CR>

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

highlight Debug ctermbg=Red ctermfg=Cyan
highlight ActiveInDebuger ctermbg=white

"" called when a new document is opened to repaint the breakpoitns.
autocmd BufWinEnter * :call pdbnavigate#OnOpenDocument()
