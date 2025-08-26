
# =============== 💤 🔮 🗿 In Love with arch 
##   zsh > bashzzz   ~~~  CONFIGURACIÓN DE LINUX WSL EN WINDWOS!!! 26/08/2025 🔮 🔥 🚀
# ───────────────────────────────────

                  -`                       root@classmate
                 .o+`
                `ooo/                        Arch Linux x86_64
               `+oooo:                       Linux 5.15.167.4-microsoft-standard-WSL2
              `+oooooo:                      188 (pacman)
              -+oooooo+:                     zsh 5.9
            `/:-:++oooo+:                    Windows Terminal
           `/++++/+++++++:                   WSLg 1.0.65 (Wayland)
          `/++++++++++++++:                  6 hours, 56 mins
         `/+++ooooooooooooo/`              PU  Intel(R) Celeron(R) N4000 (2) @ 1.09 GHz
        ./ooosssso++osssssso+`             󰍛  538.21 MiB / 1.84 GiB (29%)
       .oossssso-````/ossssss+`            󰋊  1.80 GiB / 1006.85 GiB (0%) - ext4
      -osssssso.      :ssssssso.           󰋊  70.77 GiB / 73.73 GiB (96%) - 9p
     :osssssss/        osssso+++.          󰛿  192.168.21.211/20
    /ossssssss/        +ssssooo/-          󰁹  100% [AC Connected]

```~ ❯ pacman -Qet | tail -n 20                                                                                 root@classmate 02:35:36
base 3-2
eza 0.23.0-1
fastfetch 2.50.2-1
github-cli 2.78.0-1
nano 8.6-1
stow 2.4.1-1
yazi 25.5.31-2
zsh-autosuggestions 0.7.1-1
zsh-syntax-highlighting 0.8.0-1

~ ❯                                                                     root@classmate 02:35:39
```

![JJK  Art - 4](https://github.com/user-attachments/assets/50fd1d94-5478-4997-84d0-1e4187b28902)


# ───────────────────────────────────
## ARCHWSLINSTALL - RESUMEN. + [Opcional]Yay + Configurar usuario root etc.
```## 📌!!! no INSTALES NVIM ni nada innecesario. Los alias se encargan de enlazar tus programas de windows con WSL```
```## 📌¡¡¡ Para que funcione .zshrc asegurate de adaptar los paths de; \user [diego] > y asi fucioaran los alias.```
```## 📌!!! Para los dotfiles puedes o bien copiarlos a tu directorio .config [PERO STOw es mejor]```
```## 📌¡¡¡ Mientras que Code si abre stow files [gracias a WSL], al usar nvim .zshrc no lo abre porque no lee symlinks.```
```## 📌!!! Solucion: nvim [path completo] ej: {nvim ~/dotfiles-wsl-dizzi/zsh/.zshrc}```
##                      INSTALAR ARCH o DEBIAN + REVISAR DISTROS
### Listar distros [desde POWERSHELL WINDOWS]
```wsl --list --online```
### Instalar arch
```wsl --install --distribution Arch```

### O si lo prefieres.. DEBIAN
```wsl --install --distribution Debian```

### Para remover un distro..
```wsl --unregister Debian```

### Iniciar la distro por 1ra vez
```wsl.exe -d archlinux```

##             Parte 2: Obtener root para habilitar sudo pacman+cambiar bash > to zsh

### Actualizar el sistema+cambiar de bash a zsh
```pacman -Sy
pacman -S git base-devel zsh sudo```

### Cambiar de sesion en zsh
```chsh -s /usr/bin/zsh```

### Establer sudo [permisos root], ejecuta
```visudo```

#### editar sudoers
```nano /etc/sudoers
```

```
root ALL=(ALL) ALL
%wheel ALL=(ALL:ALL) ALL
```

##             Parte 3: Instalar oh-my-zash + zsh plugins hermosos, divinos [sasel controla mi menteee~~]

#### ~ > instalar oh-my-zash
```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# ~ > plugins zsh
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/zsh-autocomplete

git clone https://github.com/Aloxaf/fzf-tab.git ~/.zsh/fzf-tab
```

#
##                      Parte 4: INSTALAR PAQUETES BASICOS + dotfiles-wsl-dizzi
#

### ~ > Clonar tus dotfiles:
```git clone https://github.com/dizzi1222/dotfiles-wsl-dizzi
cd dotfiles-wsl-dizzi

stow .
```

#### si encuentras un conflicto, eliminalo {Al hacer stow} [No uses --adopt]

### Zsh paquetes, gh auth etc
```sudo pacman -S git github-cli eza fastfetch nano stow yazi nodejs fzf ripgrep tmux python-pipx
```
```

#
##                    Parte 5: Gestión de usuarios y permisos
#                      
#

```useradd -m -g users -G wheel diego
passwd diego
```

### Crear, Darle permisos al usuario, entrar al usuario [Necesario para la aUR {pamac, yay o paru}]
```chown -R diego:users /home/diego/yay
su diego
```

### [OPCIONAL] instalar yay para la AUR {200mb aprox}.. necesitas chown 
```# ~ > {si te  encuentras en "diego".. sal y ve a root}
exit 

cd ~
git clone https://aur.archlinux.org/yay.git

su diego

cd ~/yay
makepkg -si
```

