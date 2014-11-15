# Emacs, batteries included

This is my Emacs configuration.
I'm a recent Emacs user and so this is still very much a work in progress.
At the moment, it's tailored for Lisp development.

Explore before using, as some common Emacs key bindings have been replaced.


## Requirements

- Emacs 24.4 or greater,
- `hunspell`, if you want to use spell checking.


## Installing

To install, clone this repository to `~/.emacs.d/`, using:

    git clone --recursive https://github.com/joca-bt/dot-emacs.git ~/.emacs.d/

All dependencies are included.


## Organization

- `init.el` - bootstrapper,
- `configuration/` - general configuration files, split by category,
- `configuration/modes/` - programming languages and major modes,
- `configuration/ui/` - ui customizations,
- `packages/` - packages go here,
- `packages/themes/` - themes go here.
