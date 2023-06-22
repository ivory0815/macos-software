#!/bin/bash

# Funktion zur Überprüfung des Programmstatus
check_program_installed() {
  command -v "$1" &>/dev/null
}

# Liste der Programme
programs=(
  "shottr"
  "deepl"
  "bitwarden"
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
  "hidden-bar"
  "tinker-tool"
  "spotify"
  "handbrake"
  "cyberghost"
  "microsoft-edge"
)

# Installationsloop
for program in "${programs[@]}"; do
  if check_program_installed "$program"; then
    echo "$program ist bereits installiert."
  else
    echo "Installiere $program..."
    brew install --cask "$program"
  fi
done
