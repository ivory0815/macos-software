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

# Skript zur Installation von Microsoft Office ohne PIDKEY
deployToolUrl="https://go.microsoft.com/fwlink/?linkid=2165710"
deployToolDir="$HOME/OfficeDeploy"
configurationFile="configuration.xml"

echo "Lade Microsoft Office Deployment Tool herunter..."
curl -L -o "$deployToolDir/OfficeDeploy.exe" "$deployToolUrl"

echo "Erstelle Konfigurationsdatei..."
cat > "$deployToolDir/$configurationFile" <<EOL
<Configuration>
  <Add OfficeClientEdition="64" Channel="PerpetualVL2021">
    <Product ID="ProPlus2021Volume" PIDKEY="######" />
  </Add>
  <Updates Enabled="TRUE" />
  <Display Level="None" AcceptEULA="TRUE" />
  <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
  <Property Name="AUTOACTIVATE" Value="0" />
</Configuration>
EOL

echo "Installiere Microsoft Office..."
"$deployToolDir/OfficeDeploy.exe" /configure "$deployToolDir/$configurationFile"

echo "Entferne Microsoft Office Deployment Tool..."
rm -rf "$deployToolDir"

echo "Microsoft Office wurde erfolgreich installiert."

echo "Alle Installationen abgeschlossen."
