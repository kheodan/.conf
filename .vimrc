filetype on
filetype plugin on
"set hls "подсвечивать поиск
let loaded_matchparen = 1 
set ic " игнорировать регистр при поиске
syntax on
colors delek

set wildmenu
set wcm=<Tab>
menu menu.Save 		:w!<CR>
menu menu.Save-and-Quit	:wq!<CR>
menu menu.Quit 		:q!<CR>
map <F2> :emenu menu.<TAB>

set wildmenu
set wcm=<Tab>
menu Syntax.Vim		:set syntax=vim<CR>
menu Syntax.Bash 	:set syntax=sh<CR>
menu Syntax.Python 	:set syntax=python<CR>
menu Syntax.HTML    :set syntax=html<CR>
menu Syntax.CSS     :set syntax=css<CR>
map <F3> :emenu Syntax.<TAB>

set wildmenu
set wcm=<Tab>
menu option.MouseEnable   :set mouse=n<CR>
menu option.MouseDisable  :set mouse=i<CR>
menu option.Number-ON   :set number<CR>
menu option.Number-OFF  :set nonumber<CR>
menu option.Syntax-ON   :syntax on<CR>
menu option.Syntax-OFF  :syntax off<CR>
map <F4> :emenu option.<TAB>

set wildmenu
set wcm=<Tab>
menu colorscheme.default   :colorscheme default<CR>
menu colorscheme.delek     :colorscheme delek<CR>
menu colorscheme.slate     :colorscheme slate<CR>
menu colorscheme.blue      :colorscheme blue<CR>
map <F5> :emenu colorscheme.<TAB>

"авто-дополнение для текущего активного синтаксиса
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
 endfunction
 inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
 inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"Настройки табов для Python, согласно рекоммендациям
set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе
"let python_highlight_all = 1
set t_Co=256
set termencoding=utf-8 "Кодировка терминала
set novisualbell "Не мигать
