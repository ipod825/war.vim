if exists('g:war#loaded')
  finish
endif

let g:war#loaded = 1
if get(g:, 'war_override_min_width_height', v:true)
    set winwidth=1
    set winminwidth=1
    set winheight=1
    set winminheight=1
endif
