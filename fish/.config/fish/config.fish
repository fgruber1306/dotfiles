eval "$(/opt/homebrew/bin/brew shellenv)"

### Commands to run in interactive sessions can go here
if status is-interactive
    alias lg lazygit
    alias vi nvim
    fish_default_key_bindings
end
