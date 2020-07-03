<div align="center">
  <img src="https://github.com/SciBourne/emacs.d/raw/master/img/logo.png" width="250" title="hover text">
  <h1>GNU Emacs packages and configuration</h1>
  <br>
  <p>This is my simply Emacs configuration files for work on GNU Linux and MS Windows.</p>
  <br>
</div>

## Quick start for GNU Linux

![Screenshot](img/linux.png)

<br>

### Install the `Git` package if not already installed

Gentoo-based:
```
sudo emerge -av dev-vcs/git
````

Debian-based:
```
sudo apt install git
```

RPM-based:
```
sudo yum install git
```

<br>

### Clone this repository to your home directory

```
cd ~/
git clone https://github.com/SciBourne/.emacs.d.git
```

<br>

### Edit configuration

Edit the configuration files as you like. First of all, pay attention to the settings of the UI.

###### Configuration files:

| Path | Description |
| --- | --- |
| ~/emacs.d/init.el | Main initialization file |
| ~/.emacs.d/config | User init files directory |
| ~/.emacs.d/config/packages.el | User package set for automatically install them at startup |
| ~/.emacs.d/config/extensions.el | Extension, setting and modes |
| ~/.emacs.d/config/theme-gui.el | Color themes and packages setting for GUI |
| ~/.emacs.d/config/theme-tty.el | Color themes and packages setting for TTY |
| ~/.emacs.d/config/keybinding.el | User keybinding |
| ~/.emacs.d/config/locale.el | Encoding setting |
| ~/.emacs.d/config/irc.el | Template setting for RCIRC client |

