
# =============== 💤 🔮 🗿 In Love with arch 
##   zsh > bashzzz btw~  CONFIGURACIÓN DE LINUX WSL EN WINDWOS!!! 26/08/2025 🔮 🔥 🚀
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


<img width="691" height="1080" alt="![JJK  Art - 4]" src="https://github.com/user-attachments/assets/ae102d70-576c-405f-908d-03725f59476f" />

## ─❯ ⚠ 🚨 [DIFERENTE] Comandos en ARCH y DEBIAN {Diferencias}
```
╰─❯ Arch (pacman):
pacman -Sy
pacman -S git base-devel zsh sudo

╰─❯ Debian/Ubuntu (apt):

apt update && apt upgrade
apt install git build-essential zsh sudo

# sino remarco [Diferente] eso significa que es {igual} el proceso de configurar wsl (tanto en debian/Arch).
```


## ─❯ ⚠ 🚨 [DIFERENTE] Gestores de Paquete en ARCH y DEBIAN {Diferencias}
```
╰─❯ Arch:
pacman      -> gestor oficial (binarios de repos Arch)
yay/paru    -> ayudantes de la AUR (paquetes de la comunidad)
pamac       -> opcional, interfaz amigable (GTK/CLI) para repos + AUR
makepkg     -> compilar manualmente PKGBUILD

╰─❯ Debian/Ubuntu:
apt         -> gestor principal (binarios de repos Debian/Ubuntu)
dpkg        -> bajo nivel (instalar .deb locales)

        |
        ╰─❯ambos comparten:
          snap        -> paquetes universales de Canonical (sandbox)
          flatpak     -> paquetes universales (sandbox, independiente de Snap)
          pip/pipx    -> gestor de paquetes Python (user-space, sin tocar sistema)
```



## ARCH-WSL ~ INSTALL RESUMEN + yay [Opcional] + Configurar usuario root, AUR [Size: 1.GB]

```
## 📌!!! no INSTALES NVIM ni nada innecesario. Los alias se encargan de enlazar tus programas de windows con WSL
## 📌¡¡¡ Para que funcione .zshrc asegurate de adaptar los paths de; \user [diego] > y asi fucioaran los alias.
## 📌!!! Para los dotfiles puedes o bien copiarlos a tu directorio .config [PERO STOw es mejor]
## 📌¡¡¡ Mientras que Code si abre stow files [gracias a WSL], al usar nvim .zshrc no lo abre porque no lee symlinks.
## 📌!!! Solucion: nvim [path completo] ej: {nvim ~/dotfiles-wsl-dizzi/zsh/.zshrc}
```

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

#### editar sudoers, y agrega lo siguiente
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

##                      Parte 4: INSTALAR PAQUETES BASICOS + dotfiles-wsl-dizzi

### ~ > Clonar tus dotfiles:
```git clone https://github.com/dizzi1222/dotfiles-wsl-dizzi
cd dotfiles-wsl-dizzi

stow .

# ~ > si encuentras un conflicto, eliminalo {Al hacer stow} [No uses --adopt]

# Zsh paquetes, gh auth etc
sudo pacman -S git github-cli eza fastfetch nano stow yazi nodejs fzf ripgrep tmux python-pipx
```

## ─❯ ⚠ 🚨 [DIFERENTE] en Debian y derivados..
```
╰─❯ En Debian:

# Zsh paquetes, gh auth etc
sudo apt install git gh eza fastfetch nano stow yazi nodejs npm fzf ripgrep tmux pipx man-db locales apt-transport-https ca-certificates curl gnupg lsb-release
# Algunos paquetes extras.. Esto asegura que .zshrc, alias y compilaciones no fallen.
```


##                    Parte 5: Gestión de usuarios y permisos

```useradd -m -g users -G wheel diego
passwd diego
```


## ─❯ ⚠ 🚨 [DIFERENTE] en Debian y derivados..
```
╰─❯ En Debian:

adduser diego
usermod -aG sudo diego
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


## ─❯ ⚠ 🚨 [DIFERENTE] en Debian y derivados..
```
╰─❯ En Debian:
directamente no es posible, es exclusivo de la AUR...

I use Arch, btw.
```

# ───────────────────────────────────
## 💤 Debian Vs Arch 🦥

<img width="337" height="198" alt="8b85d9ca2b82c8355e78ec55cc0eed37" src="https://github.com/user-attachments/assets/39a8d975-cd82-4b68-9954-e1e1f784563f" />

<img width="500" height="198" alt="f8819b64cfec36b8bc574f055aeacbe8" src="https://github.com/user-attachments/assets/ac37b985-489d-4801-a8ce-1fde7ef7446d" />


[https://youtu.be/H7RQYREJO98
](https://youtu.be/H7RQYREJO98)

<img width="500" height="173" alt="8fb0bcb2e75583bab55753f549eb38a6" src="https://github.com/user-attachments/assets/df6ecb56-d359-474d-8be1-bf68c48172ff" />
