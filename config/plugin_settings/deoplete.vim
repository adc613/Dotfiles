let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'file', 'ultisnips', 'ternjs']
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:tern#command = ['tern']
let g:tern#arguments = ['-persistent']

let g:acp_enableAtStartup = 0
