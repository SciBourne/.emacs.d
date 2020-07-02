<div align="center">
  <img src="https://github.com/SciBourne/emacs.d/raw/master/img/logo.png" width="250" title="hover text">
  <h1>GNU Emacs packages and configuration</h1>
  <br>
  <p>This is my simply Emacs configuration files for work on GNU Linux and MS Windows.</p>
  <br>
</div>

## Quick start for GNU Linux

![Screenshot](img/linux.png)

### Install the `git` package if not already installed

Gentoo-based:
```shell
sudo emerge -av dev-vcs/git
````
Debian-based:
```shell
sudo apt install git
```
RPM-based:
```shell
sudo yum install git
```

### Clone this repository to your home directory

```shell
cd ~/
git clone https://github.com/SciBourne/.emacs.d.git
```

### Edit configuration

Edit the configuration files as you like. First of all, pay attention to the settings of the UI.

Configuration files:

* `init.el`
Main initialization file.

* `config`
User init files directory

** `packaged.el`
** `extensions.el`
** `theme-gui.el`
** `theme-tty.el`
** `keybinding.el`
** `locale.el`
** `irc.el`
