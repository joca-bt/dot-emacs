# Emacs, batteries included ![Emacs Icon](etc/omnisharp-icon.png)

This is my Emacs configuration, continually used and extended since 2014.
At the moment, it's mainly tailored for Lisp development.

Emacs comes with built-in support for many programming languages.
This specific configuration targets the following:
- Common Lisp,
- Emacs Lisp,
- Shell Script (Unix and Windows).

Explore before using, as some common Emacs key bindings have been replaced.


## Requirements

- Emacs 24.4 or greater,
- `hunspell`, if you want to use spell checking.


## Installing

To install, clone this repository to `~/.emacs.d/`, using:

	git clone https://github.com/joca-bt/dot-emacs.git ~/.emacs.d/

When starting Emacs for the first time, it will download and install necessary third-party packages using the built-in package manager.


## Organization

- `init.el` - bootstrapper,
- `configuration/config-packages.el` - package loading and installation,
- `configuration/` - general configuration files, split by category,
- `configuration/modes/` - programming languages and major modes,
- `configuration/ui/` - ui customizations,
- `dictionaries/` - dictionaries go here,
- `packages/` - packages go here,
- `packages/themes/` - themes go here.


## Help!

Emacs terminology primer:
- The sidebar is called the *fringe*,
- The status bar is called the *mode line*,
- clipboard `->` kill ring,
- cut `->` kill,
- save `->` copy,
- paste `->` yank,
- region - the text that is *marked* (selected), starting at *mark* and ending at *point* (cursor location).

Links:
- [Sexy Emacs!](http://emacs.sexy/)
