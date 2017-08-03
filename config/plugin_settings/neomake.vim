" Neomake settings
let g:neomake_javascript_enabled_makers = []
let g:neomake_g4lint_maker = {
          \ 'exe': 'g4',
          \ 'args': ['lint'],
          \ 'errorformat': '%A%m%>//depot/google3/%f:%l',
          \ }

"let g:neomake_java_checkstyle_maker = {
          "\ 'exe': ' /home/build/nonconf/google3/tools/java/checkstyle/gcheckstyle.sh',
          "\ 'args': ['-g'],
          "\ 'errorformat': '%*[^/]%f:%l: %m',
          "\ }
let g:neomake_java_enabled_makers = ['g4lint']

let g:neomake_gpylint_maker = {
          \ 'exe': 'gpylint',
          \ 'args': [],
       \ 'errorformat':
          \ '%f:%l: [%t%n%.%#] %m,%f:%l: [%t%.%#] %m,%Z,%-GNo config%m'
          \ }
let g:neomake_python_enabled_makers = ['gpylint']


autocmd! BufWritePost,BufEnter * Neomake
