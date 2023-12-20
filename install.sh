#!/bin/bash

# Liste der Programme
declare -a programs=(
  "shottr"
  "deepl"
  "bitwarden"
  "menubarx"
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
  "handbrake"
  "microsoft-edge"
  "parsec"
)

# Funktion zur Überprüfung des Programmstatus
check_program_installed() {
  local program="$1"
  local installed=$(brew list --cask --versions 2>/dev/null | grep "^$program\$")

  if [ -n "$installed" ]; then
    echo "$program ist als Cask installiert."
    return 0
  elif [ -x "$(command -v "$program")" ]; then
    echo "$program ist als AppImage oder andere Distributionsform installiert."
    return 0
  elif [ -d "/Applications/$program.app" ]; then
    echo "$program ist im Verzeichnis /Applications installiert."
    return 0
  else
    echo "$program ist nicht installiert."
    return 1
  fi
}

# Überprüfung der Programme
for program in "${programs[@]}"; do
  check_program_installed "$program"
done

# Installation der Programme
while true; do
  read -p "Möchtest du die Programme installieren? (j/n) " answer
  case "$answer" in
    j)
      for program in "${programs[@]}"; do
        if ! check_program_installed "$program"; then
          echo "Installiere $program..."
          if ! brew install --cask "$program"; then
            echo "Fehler beim Installieren von $program."
          fi
        fi
      done
      break
    ;;
    n)
      echo "Programme nicht installiert."
      break
    ;;
    *)
      echo "Ungültige Eingabe. Bitte antworte mit 'j' für Ja oder 'n' für Nein."
  esac
done
