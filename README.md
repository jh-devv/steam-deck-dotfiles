# steam-deck-dotfiles

Hey! These are my dotfiles for the steam deck ^w^

📷 [screens](#--screens)
📝 [info](#--info)
💻 [usage](#--usage)

---

## ↛ 📷 screens

![showdown](https://github.com/jh-devv/steam-deck-dotfiles/assets/122896463/f27cfc16-2011-4626-a4f4-6eee0ce723fc)

---

## ↛ 📝 info

### desktop

```text
OS: SteamOS 3 HoLo
Compositor: KDE
GTK Theme: Catppuccin Mocha Lavemder
Icon Theme: Papyrus
Font: FiraCode Nerd Font
```

### steam deck mods

```text
Plugin-manager: Decky
CryoUtilities
```

### terminal

```text
Terminal: Konsole
Shell: Zsh 5.9
Fetch: Neofetch
Prompt: Starship
Editor: Intelj Idea
```

### apps

```text
Browser: Chrome
File Manager: Dolphin
```

---

## ↛ 💻 usage

install dotfiles to system:

> NOTE: My .gitconfig is included, so be sure to edit it with your info, or else you'll commit stuff as me!

```sh
curl -s https://raw.githubusercontent.com/jh-devv/steam-deck-dotfiles/main/.local/bin/install.sh | sh
```

add a configuration from system:

```sh
dots add <your-file>
dots commit -m "Added <your-file>"
dots push origin main
```
