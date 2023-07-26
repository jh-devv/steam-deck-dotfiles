#!/bin/bash

#
# Steam deck dot files install script
#

# Define paths and variables
DOTFILES_REPO="jh-devv/steam-deck-dotfiles"
DOTFILES_URL="https://github.com/$DOTFILES_REPO.git"
DOTFILES_DIR="$HOME/.dots"
BACKUP_DIR="$HOME/.dots-backup"

GIT_BIN=$(which git)

# Colors for console output
ESC_SEQ="\x1b["
COL_RESET="$ESC_SEQ""39;49;00m"
COL_RED="$ESC_SEQ""31;01m"
COL_GREEN="$ESC_SEQ""32;01m"
COL_YELLOW="$ESC_SEQ""33;01m"

function ok() { echo -e "$COL_GREEN[ok]$COL_RESET $1"; }
function bot() { echo -e "\n$COL_GREEN(っ◕‿◕)っ$COL_RESET - $1"; }
function running() { echo -en "$COL_YELLOW ⇒ $COL_RESET $1: "; }
function action() { echo -e "\n$COL_YELLOW[action]:$COL_RESET\n ⇒ $1..."; }
function warn() { echo -e "$COL_YELLOW[warning]$COL_RESET $1"; }
function error() { echo -e "$COL_RED[error]$COL_RESET $1"; }

function dots {
    $GIT_BIN --git-dir="$DOTFILES_DIR" --work-tree="$HOME" "$@"
}

function clone_dotfiles_repository {
    action "Cloning with $GIT_BIN"
    running "Cloning git repo from $DOTFILES_URL"
    $GIT_BIN clone --bare "$DOTFILES_URL" "$DOTFILES_DIR"
    if [ $? = 0 ]; then
        ok "Git repo cloned successfully."
    else
        error "Git repo already exists at $DOTFILES_DIR; exiting"
        exit $?
    fi
}

function backup_existing_dotfiles {
    action "Check conflicts"

    dots checkout

    if [ $? = 0 ]; then
        ok "Dotfiles checked out successfully."
    else
        mkdir -p "$BACKUP_DIR"
        warn "Conflicts with existing dot files. Backing up to $BACKUP_DIR and retrying..."
        # Move conflicting dotfiles to the backup directory
        dots checkout 2>&1 | grep -E "^\s+" | awk {'print $1'} | xargs -I{} mv {} "$BACKUP_DIR"/
        dots checkout
        ok "Dotfiles checked out successfully."
    fi
}
function configure_dots {
    dots config status.showUntrackedFiles no
    ok "Dot's git config configured"
}

function install_dependencies {
    action "Installing dependencies..."
    #TODO
    ok "Dependencies installed."
}

function main {
    cat <<"EOF"

    .  ───── jh's ─────  .
    ┌┬┐┌─┐┌┬┐┌─┐┬┬  ┌─┐┌─┐
     │││ │ │ ├┤ ││  ├┤ └─┐
    ─┴┘└─┘ ┴ └  ┴┴─┘└─┘└─┘
    ·  ───── ·  · ─────  ·
EOF

    bot "Welcome to the Jh-Devv's Dotfiles Setup"

    # Check if the "--deps" or "-d" flag is provided to install dependencies
    if [[ "$1" == "--deps" || "$1" == "-d" ]]; then
        install_dependencies
    fi

    clone_dotfiles_repository
    backup_existing_dotfiles
    configure_dots

    echo -e "\n"
    ok "Dotfiles setup completed. Enjoy your steam deck 🚀"
    echo -e "Ensure that you apply all themes and enable CEF Remote Debugging in Steam Deck's Developer settings, if necessary."
}

main "$@"