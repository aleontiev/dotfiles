" Vim color file

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "blackboard"

hi Error guibg=#664422
hi Normal		guifg=#dddddd guibg=#0D1021						
hi Special  guifg=#cc5500
hi Comment	  guibg=#333333 guifg=#bbbbbb 
hi Constant	    guifg=#64ce3e
hi String       guifg=#64ae3e
hi Statement    guifg=#f8de33 
hi Entity       guifg=#fa6513
hi Support      guifg=#884444
hi LineNr       guifg=#aeaeae guibg=#000000  
hi Title		guifg=#f6f3e8 guibg=NONE
hi NonText 		guifg=#808080 guibg=#0D1021	

hi Type guifg=#0088aa
hi Visual       gui=reverse
hi VertSplit    guifg=#444444 guibg=#444444
hi StatusLine   guifg=#f6f3e8 guibg=#444444
hi StatusLineNC guifg=#857b6f guibg=#444444
hi SpecialKey	guifg=#808080 guibg=#343434
hi Search       guibg=#eeeeee guifg=#111111
hi IncSearch  guibg=#aaaaaa guifg=#333333
hi link Define          Entity
hi link Function        Entity

hi link Structure       Support
hi link Test            Support

hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant

hi link Float           Number

hi link Conditional     Statement
hi link StorageClass    Statement
hi link Operator        Statement
hi link Statement       Statement
