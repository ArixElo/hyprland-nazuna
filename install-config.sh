function __install() {
cat <<'EOF'
     ___         _      ________     _          __  __                 __                __   ______            _____      
   /   |  _____(_)  __/ ____/ /___ ( )_____   / / / /_  ______  _____/ /___ _____  ____/ /  / ____/___  ____  / __(_)___ _
  / /| | / ___/ / |/_/ __/ / / __ \|// ___/  / /_/ / / / / __ \/ ___/ / __ `/ __ \/ __  /  / /   / __ \/ __ \/ /_/ / __ `/
 / ___ |/ /  / />  </ /___/ / /_/ / (__  )  / __  / /_/ / /_/ / /  / / /_/ / / / / /_/ /  / /___/ /_/ / / / / __/ / /_/ / 
/_/  |_/_/  /_/_/|_/_____/_/\____/ /____/  /_/ /_/\__, / .___/_/  /_/\__,_/_/ /_/\__,_/   \____/\____/_/ /_/_/ /_/\__, /  
                                                 /____/_/                                                        /____/  
EOF
    printf "%s\n\n" "(c) Copyright, ArixElo ~ 2026."

    echo "Checking if you have installed required packages..."
    
    if yay -Qi < pkglist.txt &>/dev/null && yay -Qi wttrbar &>/dev/null && yay -Qi hyprland-share-preview-picker &>/dev/null && yay -Qi battop &>/dev/null && yay -Qi vicinae-bin &>/dev/null && yay -Qi wlogout &>/dev/null; then
        echo "It looks like you have already installed all packages"
        __copy
    else
        echo "Installing required packages..."
        sudo pacman -S - < pkglist.txt && yay -S wttrbar hyprland-share-preview-picker battop wlogout vicinae-bin
        __copy
    fi
}

function __copy() {
    echo "Copying all configs to ~/.config and other required dirs also changing your terminal and your shell..."
    cp -r */ ~/.config/
    cp -r vicinae/ ~/.local/share/
    chsh && sudo chsh &
    cp .zshrc /home/$USER/
    cp starship.toml ~/.config/
    mkdir -p ~/.config/zsh/
    touch ~/.config/zsh/history
    source ~/.zshrc
    echo "Restarting waybar..."
    pkill waybar && hyprctl dispatch exec waybar
    echo "Applying config is done, but for better experience: Change your location for wttrbar, and reboot your machine."
}

__install
