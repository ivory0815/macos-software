#!/bin/bash

# Liste der Programme
programs=(
 "shottr"
 "deepl"
 "bitwarden"
 "noir"
 "menubarx"
 "musicbar"
 "alfred"
 "topnotch"
 "balenaetcher"
 "visual-studio-code"
 "caffeine"
 "hyper"
 "istat-menus"
 "discord"
 "utm"
 "languagetool"
 "displaylink"
 "spotify"
 "handbrake"
 "cyberghost-vpn"
 "microsoft-edge"
 "parsec"
 "tinkertool"
)

# Funktion zur Überprüfung des Programmstatus
check_program_installed() {
    brew list --cask "$1" &>/dev/null
}

# Funktion zur Überprüfung der Programmversion
check_program_version() {
 program="$1"
 version=$(brew outdated "$program" | grep "^$program$" | cut -d " " -f 2)
 if [ -n "$version" ]; then
  echo "$program ist in Version $version installiert."
 else
  echo "$program ist nicht installiert."
 fi
}

# Überprüfung der Programmversionen
for program in "${programs[@]}"; do
 check_program_version "$program"
done

# Installation der Programme
for program in "${programs[@]}"; do
 if ! check_program_installed "$program"; then
  echo "Installiere $program..."
  brew install --cask "$program"
 fi
done
