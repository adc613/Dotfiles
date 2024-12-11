let g:flake8_show_in_gutter=1 " shows warning signs next to the number line

" Sets error markersfor all the differnt error types
let g:flake8_error_marker="EE"
let g:flake8_warning_marker=">>"
let g:flake8_pyflake_marker=">>"
let g:flake8_complexity_marker=">>"
let g:flake8_naming_marker=">>"

" vim-flake8 plugin highlighting
highlight flake8_hi guibg=#000000 guifg=#ffffff
highlight link Flake8_Error         flake8
highlight link Flake8_Warning       flake8
highlight link Flake8_Complexity    flake8
highlight link Flake8_Naming        flake8
highlight link Flake8_PyFlake       flake8
