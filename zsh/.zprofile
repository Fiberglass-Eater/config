
#Export enviorment variables
export PATH="$HOME/.cargo/bin:$PATH"
export XDG_DOWNLOAD_DIR="$HOME/tmp"
export XDG_DESKTOP_DIR="/dev/null"
export XDG_CONFIG_HOME="$HOME/sys/config"
export XDG_CACHE_HOME="$HOME/sys/cache"
export XDG_DATA_HOME="$HOME/sys/local"
export IMPUTRC="$XDG_CONFIG_HOME/imputrc"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export EDITOR="nvim"

# Autostart Xorg on login.
[ "$(tty)" = "/dev/tty1" ] && ! pidof Xorg >/dev/null 2>&1  && exec sx
