# JSteeleIR's Dotfiles

*"Your dotfiles might be the most important files on your machine."*

Dotfiles are what make your machine yours. They're customizations. Tweaks. Hacks. Little snippets that become critical parts of how we interact with our computers. Things that make the tools we use behave the way we expect them to. *I* think that's important. These are mine.

Some goals I try to take with my dotfiles:
* Dotfiles should be *portable*.
Maintaining separate configuration versions for each machine (and each OS) is
complicated and ridiculous.
* Dotfiles should seek to make workflows *consistent*.
That is, an SSH shell on a remote system should behave similarly to a local one.
* Dotfiles should be *flexible*, so that local
config overrides (for those few things that DO need to be machine-specific, or
for security reasons) can be easily made without much hassle (and without
breaking config on other machines).
* Dotfiles should be grouped *logically*, so
that related configs can be found together.
* Dotfiles should make bootstrapping a new system *easy*.
One-command bootstrap, if possible.

Now... some of these goals are new, so not all these dotfiles meet them.

# Bootstrapping:

## DON'T DO THIS UNLESS YOU'RE ME, OR REALLY WANT TO BE LIKE ME!

```bash
git clone --recursive http://github.com/JSteeleIR/dotfiles-public.git
~/.dotfiles && ~/.dotfiles/install.sh
```

# Core Components

These are the tools I've found that work the best for me:

* ZSH -- Stop hating shells. Autocomplete. Directory aliases. Plugins. 
* TMUX -- Have 1 terminal window that's organized, and always keeps it's state. (After restarts, over SSH.) 
* ViM -- Use an editor that's consistent, with keybindings you can use almost anywhere. 

# Non-Dotfile things that pair well with these:
Not everything happens in a terminal (unfortunately). These things, though, can make that experience better.

* [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb) -- Make Chrome behave like Vim. You really don't need a mouse.
* [Diodon (nix)](https://launchpad.net/diodon) -- Stop copy/pasting in serial. Use a clipboard manager. 
* [Alfred (osx)](https://www.alfredapp.com/) -- Make spotlight search *powerful.* Also a clipboard manager.

# Some Snippets I'm proud of (Probably what you're here for):

## Cross-Platform, Local & Remote, In-and-out-of-terminal yank/put:

The clipboard is a critical part of many things I end up doing. Searching for things. Saving terminal output for documentation. Cross-referencing values. Accordingly, I want my clipboard to work exactly how I expect it to, *everywhere*. In Terminal. In X. On Mac. Over SSH. It. Should. Just. Work. The same way. Everywhere.

Things I copy in my terminal should be usable in my GUI windows, and vice-versa. Things yanked from Tmux buffers should be pastable into X-Windows. And this shouldn't break when used over SSH.

[Yank](scripts/yank) makes this possible. Things piped into it get copied into Tmux buffers if we're in tmux, into the X system clipboard if it's there, and (especially useful for those [Secure Shell](https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo?hl=en). [iTerm2](https://iterm2.com/), or other OSC52-compatible terminal users) echoes the copied contents into the Terminal-Emulator buffer, *copying the buffer into the clipboard of the local window environment, even over SSH*.

```
echo "Clipboards are awesome!" | yank
```

We also want this to be mostly transparent though. Having to `|yank` everytime we want to copy something is obnoxious. 

So we make any selection that's yanked in TMUX also use it:
Relevant sections from [tmux.conf](tmux/tmux.conf):
```
# Set PATH so scripts can be run at session level.
set-environment -g PATH "$PATH:$HOME/.dotfiles/scripts"

# Add TPM to manage plugins, and bring in tmux-yank
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-yank'

# override tmux-yank copy program to use the yank script:
set -g @override_copy_command 'yank > #{pane_tty}'

# Copy pasting from terminal - need to enter 'copy mode' first - '<prefix> ['
unbind p
unbind-key -T copy-mode-vi v
bind p paste-buffer
bind-key -T copy-mode-vi 'v' send-keys -X begin-selection
#Blockwise copy mode:
bind-key -T copy-mode-vi 'C-v' send -X begin-selection \; send -X rectangle-toggle
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'yank > #{pane_tty}'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

We also want some selections in vim to make their way to the TMUX or GUI clipboards. But probably not all. (Lots of things get copied into a buffer in Vim, and we don't really want to pollute the broader clipboards with those.)
From [vimrc](vim/vimrc):
```
" Clipboard overrides for system-clipboard integration and SSH-TMUX-Forwarding
" copy the current text selection to the system clipboard
if has('gui_running') || has('nvim') && exists('$DISPLAY')
  noremap <Leader>y "+y
else
  " copy to attached terminal using the yank(1) script:
  " https://github.com/sunaku/home/blob/master/bin/yank
  noremap <silent> <Leader>y y:call system('yank > /dev/tty', @0)<Return>
endif
```

Now, when a selection is highlighted in vim, a `<leader>y` (It's `|y` in my config), makes whatever was selected available to paste whereever. Into that Chrome window. Via `prefix+]` in the next Tmux pane. Or, just keep it in the clipboard manager to use later.


## Local Overides:

Where implemented (zsh, vim), files located in ~/.dotfiles_local/<config_dir>/
will take precedence over those in ~/.dotfiles/<config> This

## ZSH Sort-Order Sourcing:

Since flexibility and the ability to apply system/environment specific overrides
are important, things in the [zsh/zsh.d/](./zsh/zsh.d/) config directory are merged with
configs in the ~/.dotfiles_local/zsh/zsh.d directory, if it exists, and configurations
are applied in order. Therefore, if there's something machine-specific that
needs to override a setting configured in ~/.dotfiles/zsh/zsh.d/10-config.zsh,
it can be defined in ~/.dotfiles_local/zsh/zsh.d/10-config.zsh, and be
overridden. 

NOTE: Configs are additive, and overridden in alphanumeric sort order.

If ~/.dotfiles/zsh/zsh.d/10-config.zsh contains
```
export VAR1=blah1
export VAR2=blah2
```
and ~/.dotfiles_local/zsh/zsh.d/10-config.zsh contains
```
export VAR1=blah3
```
The environment of the shell in the end will contain
```
VAR1=blah3
VAR2=blah2
```

To get the ordering in which your configs are sourced, a zsh alias is provided:
`$> printzshsources`
