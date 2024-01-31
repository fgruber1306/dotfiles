### PATH ###
set default_path /usr/bin /usr/sbin /bin /sbin
set -gx PATH ~/Library/Python/3.11/bin $PATH
set homebrew /usr/local/bin /usr/local/sbin
set -gx XDG_CONFIG_HOME ~/.config
set -gx PATH $homebrew $default_path
set -gx NVM_DIR ~/.nvm

### Commands to run in interactive sessions can go here
if status is-interactive
    alias lg lazygit
    alias vi nvim
    fish_default_key_bindings
end
