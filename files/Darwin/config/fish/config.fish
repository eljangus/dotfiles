function fish_greeting
end

function ps5 --description 'Show PS5 controller battery level'
    set battery_paths /sys/class/power_supply/ps-controller-battery-*
    if not set -q battery_paths[1]
        echo "🎮 PS5 Controller: nicht verbunden"
        return 1
    end

    set battery_path $battery_paths[1]
    set capacity (cat $battery_path/capacity)
    set battery_status (cat $battery_path/status)

    set bar_length 20
    set filled (math "round($capacity / 100 * $bar_length)")
    set empty (math "$bar_length - $filled")

    set bar (string repeat -n $filled '█')(string repeat -n $empty '░')

    echo "🎮 PS5 Controller: [$bar] $capacity% ($battery_status)"
end

alias lg='lazygit'
alias ls='eza -la --icons --'
alias cff='reset && fastfetch'
alias i='brew install'
alias u='brew update && brew upgrade'
alias r='brew uninstall'
alias s='brew search'

/opt/homebrew/bin/starship init fish | source
export PATH="$HOME/.local/bin:$PATH"
/opt/homebrew/bin/brew shellenv | source
