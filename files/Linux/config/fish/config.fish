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
alias i='sudo pacman -S'
alias u='sudo pacman -Syu'
alias r='sudo pacman -Rns'
alias s='sudo pacman -Ss'

starship init fish | source
export PATH="$HOME/.local/bin:$PATH"
