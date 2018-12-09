
<!-- 😱 Reggie 😱 -->

![reggie title](assets/Reggie.png)

<h3 align="center">Automatic registers for yank and paste</h3>


----

## Installation

    Plug 'dylnmc/reggie.vim'

A typical use case might be using this to quickly yank or paste from the system
clipboard:

1. `:SetYankReg +`
    - Use `+` for yanking with reggie
2. `\\yy`
    - yank to system clipboard (like `"+yy`)
    - this assumes `\\` is localleader and using default maps

*or*

1. `:SetPasteReg +`
    - Use `+` for pasting with reggie
2. `\\p`
    - paste from system clipboard (like `"+p`)


## Usage

| command              | usage                                       |
| -------------------: | :------------------------------------------ |
| `:SetPasteReg [reg]` | Set paste register to `[reg]`               |
| `:SetYankReg [reg]`  | Set yank register to `[reg]`                |
| `:SetReg [reg]`      | Set both yank/paste registers to `[reg]`    |
| `:NoPasteReg`        | Unset paste register                        |
| `:NoYankReg`         | Unset yank register                         |
| `:NoReg`             | Unset both yank/paste registers             |
| `:RegPrompt`         | Prompt and set both yank/paste              |


## Default Maps

Change `<localleader>p`, for instance, to just `p` if you want `p` to be
remapped to this. *Note* that this conflicts with *vim-pasta* and other plugins
that map `p`, as well. A better mapping might be to use `<leader>p`, for
instance.

```vim
nmap <localleader>p <plug>(reggiePasteAfter)
xmap <localleader>p <plug>(reggiePasteAfter)
nmap <localleader>P <plug>(reggiePasteBefore)
xmap <localleader>P <plug>(reggiePasteBefore)
nmap <localleader>y <plug>(reggieYank)
xmap <localleader>y <plug>(reggieYank)
nmap <localleader>" <plug>(reggiePrompt)
```


## Functions

| function                 | explanation                                                                                                |
| ------------------------ | ---------------------------------------------------------------------------------------------------------- |
| `reggie#setPaste([reg])` | Expects [reg] as the on and only parameter, and it will set reggie's paste register                        |
| `reggie#setYank([reg])`  | Expects [reg] as the on and only parameter, and it will set reggie's yank register                         |
| `reggie#getPaste()`      | Returns one character: reggie's paste register.                                                            |
| `reggie#getYank()`       | Returns one character: reggie's yank register.                                                             |
| `reggie#prompt()`        | Prompts for one character and then sets both reggie's paste and yank registers to this inputted character. |

### Statusline

If you want to be able to see what registers reggie is set to for yank and/or
paste, then you can use `reggie#getPaste()` and `reggie#getYank()`

For example

    set statusline+=P:@%{reggie#getPaste()}\ Y:@%{reggie#getYank()

will append something like `P:+ Y:+` to your statusline line if, for this
example, both registers are set to `+`. If you're using airline or another
statusline plugin, then you need to use their underlying mechanisms to add
arbitrary text and function output to the statusline.


## TODO

* `c`, `d`, `x`, etc are not yanked to reggie's registers.
    - Do we want to or need to fix this?
    - How?

* Use `<leader>` instead of `<localleader`?
    - `<localleader>` is annoying
    - However, it is more out-of-the-way: use should map this himself/herself

* If we're already purposefully writing to a register, don't clobber `@"`
  register?
    - Make this optional?

## 😊

##### Contributors 😎 [dylnmc](https://github.com/dylnmc) [b0o](https://github.com/b0o)
##### Inspiration 😃 [b0o](https://github.com/b0o)
