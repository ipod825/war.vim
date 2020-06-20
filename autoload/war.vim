function! war#fire(...)
    let b:war_fired = get(b:, "war_fired", v:false)
    if b:war_fired
        return
    endif
    let b:war_fired = v:true
    let b:war_width_enter = a:1>=0? float2nr(a:1 * &columns) : winwidth(0)
    let b:war_height_enter = a:2>=0? float2nr(a:2 * &lines) : winheight(0)
    let b:war_width_leave = a:3>=0? float2nr(a:3 * &columns) : winwidth(0)
    let b:war_height_leave = a:4>=0? float2nr(a:4 * &lines) : winheight(0)
    autocmd WinEnter <buffer> call war#enter(-1)
    autocmd BufEnter <buffer> call war#enter(-1)
    autocmd WinLeave <buffer> call war#leave()
    call timer_start(1, function('war#enter'))
endfunction

function! war#can_resize_height()
    let l:orig_win_id = win_getid()
    let l:res = v:false
    silent! noautocmd wincmd k
    if l:orig_win_id != win_getid()
        let l:res =  v:true
        silent! noautocmd wincmd j
    endif
    silent! noautocmd wincmd j
    if l:orig_win_id != win_getid()
        let l:res =  v:true
    endif
    call win_gotoid(l:orig_win_id)
    retur l:res
endfunction

function! war#enter(timer)
    exec 'vertical resize '.b:war_width_enter
    if war#can_resize_height()
        exec 'resize '.b:war_height_enter
    endif
endfunction

function! war#leave()
    exec 'vertical resize '.b:war_width_leave
    if war#can_resize_height()
        exec 'resize '.b:war_height_leave
    endif
endfunction
