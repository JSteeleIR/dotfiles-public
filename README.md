# JSteeleIR's Dotfiles

This is a collection of my dotfiles and configurations, to make the tools that I
use regularly behave the way that I want them to.

*"Your dotfiles might be the most important files on your machine."*

Some goals I try to take with my dotfiles:
* Dotfiles should be *portable*.
Maintaining separate configuration versions for each machine (and each OS) is
complicated and ridiculous.
* Dotfiles should be *flexible*, so that local
config overrides (for those few things that DO need to be machine-specific, or
for security reasons) can be easily made without much hassle (and without
breaking config on other machines).
* Dotfiles should be grouped *logically*, so
that related configs can be found together.
* Dotfiles should make bootstrapping
a new system *easy*. One-command bootstrap, if possible.

Now... some of these goals are new, so not all these dotfiles meet them.

# Bootstrapping:

## DON'T DO THIS UNLESS YOU'RE ME, OR REALLY WANT TO BE LIKE ME!

```bash
git clone --recursive http://github.com/JSteeleIR/dotfiles-public.git
~/.dotfiles && ~/.dotfiles/install.sh
```

# Some Snippets I'm proud of (Probably what you're here for):

## Local Overides:

Where implemented (zsh, vim), files located in ~/.dotfiles_local/<config_dir>/
will take precedence over those in ~/.dotfiles/<config> This

## Sort-Order Sourcing:

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
