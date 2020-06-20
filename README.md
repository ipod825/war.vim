war.vim
=============

War.vim let user decide when to resize certain windows automatically.

## Installation
------------

Using vim-plug

```viml
Plug 'ipod825/war.vim'
```

## Example Usage
------------
```viml
    augroup WAR
        autocmd!
    	" Maximize/Minimize quickfix window's height
        autocmd Filetype qf :call war#fire(-1, 0.9, -1, 0.05)
    	" Maximize/Minimize fugitive window's height
        autocmd Filetype fugitive :call war#fire(-1, 0.9, -1, 0.1)
    augroup END
```

## Related
------------
- [lens.vim](https://github.com/camspiers/lens.vim)
- [golden-ratio](https://github.com/roman/golden-ratio)
