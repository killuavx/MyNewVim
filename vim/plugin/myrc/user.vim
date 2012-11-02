let g:snips_author = 'Hunag Ronghua <huangronghua@ndoo.net>'
let g:calendar_diary = "~/ubuntuone/vimwiki/diary"
let wiki_default = {  'path': '~/ubuntuone/vimwiki/work',
            \ 'html_header': '~/ubuntuone/vimwiki/template/header.tpl',
            \ 'html_footer': '~/ubuntuone/vimwiki/template/footer.tpl',
            \ 'template_detault': 'template',
            \ 'template_ext': '.tpl',
            \ 'diary_link_count': 5}
let wiki_blog = {  'path': '~/ubuntuone/vimwiki/blog',
            \ 'html_header': '~/ubuntuone/vimwiki/template/header.tpl',
            \ 'html_footer': '~/ubuntuone/vimwiki/template/footer.tpl',
            \ 'template_detault': 'template',
            \ 'template_ext': '.tpl',
            \ 'diary_link_count': 5}
let g:vimwiki_list = [ wiki_default , wiki_blog ]
let g:vimwiki_camel_case = 0
let g:vimwiki_use_mouse=1
let g:vimwiki_folding = 1
