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
  "spotify"
  "handbrake"
  "cyberghost"
  "microsoft-edge"
)

# Installationsloop für Programme
for program in "${programs[@]}"; do
  if check_program_installed "$program"; then
    echo "$program ist bereits installiert."
  else
    echo "Installiere $program..."
    brew install --cask "$program"
  fi
done

# Installiere Microsoft Office mit Microsoft Autoupdate (MAU)
echo "Installiere Microsoft Office..."

# Überprüfen, ob MAU bereits installiert ist
if check_program_installed "msupdate"; then
  # Deinstalliere vorhandene Office-Versionen (optional)
  echo "Deinstalliere vorhandene Office-Versionen..."
  /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate --uninstall
fi

# Installiere Office mithilfe von MAU
/Applications/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate --install

echo "Microsoft Office wurde erfolgreich installiert."

echo "Alle Installationen abgeschlossen."
