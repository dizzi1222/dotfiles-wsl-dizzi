# =============================================================================
#
#                    CONFIGURACIÓN DE ZSH EN ARCH LINUX WSL
#
# =============================================================================


# Mapeo de teclas para la edición de comandos.
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^W' backward-kill-word
bindkey '^?' backward-kill-word


# Configuración de Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"

# Mi tema preferido.
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Lista de plugins a cargar.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh


# =============================================================================
#
#                      CONFIGURACIÓN DE HERRAMIENTAS Y PATH
#
# =============================================================================


# 📌 [Abrir nvim en windows terminal]Añade la ruta de Neovim de Windows al PATH de WSL.
export PATH="/mnt/c/Program Files/Neovim/bin:$PATH"
alias nvim='wt.exe -d "$(wslpath -w "$PWD")" nvim.exe'

# 📌 [Abrir VScode]Añade la ruta de Visual Studio Code de Windows al PATH de WSL.
# 📌 [Funciona] Depende del user que uses.
export PATH="/mnt/c/Users/Diego.DESKTOP-0CQHRL5/AppData/Local/Programs/Microsoft VS Code:$PATH"
function code() {
  if [[ -z "$1" ]]; then
    /mnt/c/Users/Diego.DESKTOP-0CQHRL5/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe .
  else
    /mnt/c/Users/Diego.DESKTOP-0CQHRL5/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe "$(wslpath -w "$1")"
  fi
}

# 📌 Explorer.exe de windows📌
# Abre el explorador de Windows en la ubicación actual de WSL.
alias explorer='explorer.exe .'

# 📌[Photo, picasa] Función para abrir el visor de fotos de PREDETERMINADO Windows.
function picasa() {
    if [[ -z "$1" ]]; then
        explorer.exe .
    else
        explorer.exe "$(wslpath -w "$1")"
    fi
}

# 📌 [VLC] Abre un video con el VLC de Windows.
function vlc() {
  /mnt/c/Program\ Files/VideoLAN/VLC/vlc.exe "$(wslpath -w "$1")"
}


# 📌 [Notepads] Abre un texto con el notepad de Windows.
function notepad() {
    if [[ -z "$1" ]]; then
        notepads.exe
    else
        notepads.exe "$(wslpath -w "$1")"
    fi
}

# Añade el directorio global de npm al PATH.
export PATH=~/.npm-global/bin:$PATH

# Integración con la terminal Ghostty.
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
  source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
fi


# =============================================================================
#
#                     ALIAS, FUNCIONES Y OTRAS OPCIONES
#
# =============================================================================


# Alias para reemplazar 'ls' con 'exa' (requiere que 'exa' esté instalado).
alias ls='exa --icons --color=always'

# Carga de plugins externos.
# Nota: La ruta de estos plugins es específica. Si no funcionan, verifica que
# estén instalados en el directorio correcto y que la ruta sea válida.
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

# Configuración del Historial de Zsh.
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt extendedhistory

function zle-line-finish() {
  zle .accept-line
  print -s $BUFFER
}
zle -N zle-line-finish

# Alias para guardar y mostrar el historial.
rm -f /tmp/history
alias history='fc -l 1 > /tmp/history && cat /tmp/history'

# Carga de un programa al iniciar la terminal (opcional).
fastfetch


# =============================================================================
#
#                        CONFIGURACIÓN DEL PROMPT
#
# =============================================================================

# Configuración del prompt instantáneo de Powerlevel10k.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Carga la configuración del prompt.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# HABILITAR OH MY POSH [trae mas temas]
# https://ohmyposh.dev/docs/themes
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/1_shell.omp.json')"
