  set runtimepath^=~/sys/local/vim runtimepath+=~/sys/local/vim/after
    let &packpath = &runtimepath
set number relativenumber
syntax on 
let mapleader =" "
filetype plugin on
set nocompatible
"--------------------Plugins--------------------" 
"Vim-Plug is my plugin manager. Run PlugInstall after adding a new plugin to this list to add it to the system.                   
call plug#begin('~/sys/local/vim/plugged')

Plug 'https://github.com/junegunn/goyo.vim.git' 
Plug 'junegunn/vim-plug'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0
	set conceallevel=1
	let g:tex_conceal='abdm'
Plug 'vimwiki/vimwiki'
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:UltiSnipsEditSplit="vertical"
call plug#end()

"Goyo centers the text in a doc allowing for easy readability after pressing "Space + g
map <leader>g :Goyo \| set linebreak<CR>

"-------------------Colors-------------------"
"Enables the use of the "endless" color palette
	set termguicolors

"Sets the colorsceme. This should be pulled from github or some other repo using vim-plug.
	colorscheme gruvbox

"--------------------Formatting changes--------------------"

"Enables autocomplete as I am lazy af
	set wildmode=longest,list,full

"Makes new splits open below or to the right of the old window, as is proper.
	set splitbelow splitright

" Disable auto commenting on a new line bc its cringe 
	autocmd FileType * setlocal formatoptions-=c formatoptions -=r formatoptions-=o
 
"Autosync .Xresources and .Xdefaults after updating them
 	autocmd BufWritePost *Xresources, *Xdefaults !xrdb %

 "Update keybinds when sxhkdrc is changed
 	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

"--------------------LaTeX, groff, and other doc garbage--------------------"

"Autocompile LaTeX on document save. 
	autocmd BufWritePost *.tex :! pdflatex %

"LaTeX preview window and compile shortcuts.
	map <leader>c :! pdflatex %<CR><CR>
"map <leader>p :! zathura $(echo % /| sed 's/tex$/pdf/') & disown<CR><CR> &

"der>p :! zathura $(echo % | sed 's/tex$/pdf/') & disown<CR><CR> &Clean the tex build files when the file is closed.

"Makes sure that files are read in the correct way for syntax highlighting.
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd Bufread,BufNewFile *.tex set filetype=tex
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/sys/local/calcurse/notes/* set filetype=markdown

"Hotkey to use the built-in vim spellchecker.
	map <leader>s :set spell!<CR>

"Make Goyo the default view  for .tex documents
	autocmd BufRead,BufNewFile *.tex :Goyo


"Hotkey to jump to the next misspelled word and open the correction menu in spellcheck mode.
	map <leader>] ]sz=

" Vimtex plugin stuff
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdm'

" Setup vimwiki to use the settings that I want it to. 
let g:vimwiki_list = [{'path': '~/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Setup my buffer to use Goyo by default 
	autocmd BufRead,BufNewfile /tmp/buffer :Goyo

" Autoenable spellcheck on markdown and latex files.
	autocmd BufRead,BufNewfile *.md,*.tex :set spell


"--------------------Extra editing commands -------------------"

" Shortens the commands to copy to system and "mouse" clipboards
nnoremap <C-y > "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+

nnoremap <A-y > "*y
vnoremap <A-y> "*y
nnoremap <A-p> "*p
vnoremap <A-p> "*
