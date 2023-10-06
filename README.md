# NVim Config Files

This repository houses my NeoVim configuration files written in Lua.

These files were written by me while following along with ThePrimeagen's
tutorial video, ["0 to LSP: Neovim RC From Scratch"](https://www.youtube.com/watch?v=w7i4amO_zaE&t=287s).

Minor adjustments have been made over time so these files deviate from the tutorial in minor ways.

In order for plugins to be installed, the plugin manager Packer is required from 
[wbthomason's GitHub repo](https://github.com/wbthomason/packer.nvim). Once Packer is installed, navigate 
to lua/theprimeagen/packer.lua and type ":PackerSync".

The Treesitter plugin will also require a C compiler to function. I installed MinGW GCC via the command line 
package manager, Scoop, on my windows machine.
