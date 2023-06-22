#!/bin/bash

# Funktion zur Überprüfung des Programmstatus
check_program_installed() {
  if ! command -v "$1" &>/dev/null; then
    return 1 # Nicht installiert
  else
    return 0 # Installiert
  fi
}

# Shottr
if check_program_installed "shottr"; then
  echo "Shottr ist bereits installiert."
else
  echo "Installiere Shottr..."
  # Befehl zum Installieren von Shottr
  brew install --cask shottr
fi

# DeepL
if check_program_installed "deepl"; then
  echo "DeepL ist bereits installiert."
else
  echo "Installiere DeepL..."
  # Befehl zum Installieren von DeepL
  brew install --cask deepl
fi

# Bitwarden
if check_program_installed "bitwarden"; then
  echo "Bitwarden ist bereits installiert."
else
  echo "Installiere Bitwarden..."
  # Befehl zum Installieren von Bitwarden
  brew install --cask bitwarden
fi

# Alfred
if check_program_installed "alfred"; then
  echo "Alfred ist bereits installiert."
else
  echo "Installiere Alfred..."
  # Befehl zum Installieren von Alfred
  brew install --cask alfred
fi

# TopNotch
if check_program_installed "topnotch"; then
  echo "TopNotch ist bereits installiert."
else
  echo "Installiere TopNotch..."
  # Befehl zum Installieren von TopNotch
  brew install --cask topnotch
fi

# balenaEtcher
if check_program_installed "balenaetcher"; then
  echo "balenaEtcher ist bereits installiert."
else
  echo "Installiere balenaEtcher..."
  # Befehl zum Installieren von balenaEtcher
  brew install --cask balenaetcher
fi

# Visual Studio Code
if check_program_installed "code"; then
  echo "Visual Studio Code ist bereits installiert."
else
  echo "Installiere Visual Studio Code..."
  # Befehl zum Installieren von Visual Studio Code
  brew install --cask visual-studio-code
fi

# Caffeine
if check_program_installed "caffeine"; then
  echo "Caffeine ist bereits installiert."
else
  echo "Installiere Caffeine..."
  # Befehl zum Installieren von Caffeine
  brew install --cask caffeine
fi

# Hyper Terminal
if check_program_installed "hyper"; then
  echo "Hyper Terminal ist bereits installiert."
else
  echo "Installiere Hyper Terminal..."
  # Befehl zum Installieren von Hyper Terminal
  brew install --cask hyper
fi

# iStat Menus
if check_program_installed "istatmenus"; then
  echo "iStat Menus ist bereits installiert."
else
  echo "Installiere iStat Menus..."
  # Befehl zum Installieren von iStat Menus
  brew install --cask istat-menus
fi

# Discord
if check_program_installed "discord"; then
  echo "Discord ist bereits installiert."
else
  echo "Installiere Discord..."
  # Befehl zum Installieren von Discord
  brew install --cask discord
fi

# UTM
if check_program_installed "utm"; then
  echo "UTM ist bereits installiert."
else
  echo "Installiere UTM..."
  # Befehl zum Installieren von UTM
  brew install --cask utm
fi

# LanguageTool
if check_program_installed "languagetool"; then
  echo "LanguageTool ist bereits installiert."
else
  echo "Installiere LanguageTool..."
  # Befehl zum Installieren von LanguageTool
  brew install --cask languagetool
fi

# DisplayLink Manager
if check_program_installed "displaylink"; then
  echo "DisplayLink Manager ist bereits installiert."
else
  echo "Installiere DisplayLink Manager..."
  # Befehl zum Installieren von DisplayLink Manager
  brew install --cask displaylink
fi

# Spotify
if check_program_installed "spotify"; then
  echo "Spotify ist bereits installiert."
else
  echo "Installiere Spotify..."
  # Befehl zum Installieren von Spotify
  brew install --cask spotify
fi

# HandBrake
if check_program_installed "handbrake"; then
  echo "HandBrake ist bereits installiert."
else
  echo "Installiere HandBrake..."
  # Befehl zum Installieren von HandBrake
  brew install --cask handbrake
fi

# CyberGhost VPN
if check_program_installed "cyberghost"; then
  echo "CyberGhost VPN ist bereits installiert."
else
  echo "Installiere CyberGhost VPN..."
  # Befehl zum Installieren von CyberGhost VPN
  brew install --cask cyberghost
fi

# Microsoft Edge
if check_program_installed "microsoft-edge"; then
  echo "Microsoft Edge ist bereits installiert."
else
  echo "Installiere Microsoft Edge..."
  # Befehl zum Installieren von Microsoft Edge
  brew install --cask microsoft-edge
fi
