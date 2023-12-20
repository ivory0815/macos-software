import os
import subprocess
from typing import List

# Liste der Programme
PROGRAMS: List[str] = [
  "shottr",
  "deepl",
  "bitwarden",
  "menubarx",
  "alfred",
  "topnotch",
  "balenaetcher",
  "visual-studio-code",
  "caffeine",
  "hyper",
  "istat-menus",
  "discord",
  "utm",
  "languagetool",
  "displaylink",
  "handbrake",
  "microsoft-edge",
  "parsec"
]

# Cache für Überprüfungsergebnisse
CHECK_CACHE = {}

# Funktion zur Überprüfung des Programmstatus
def check_program_installed(program: str) -> bool:
    if program in CHECK_CACHE:
        return CHECK_CACHE[program]

    check_commands = [
        f'brew list --cask --versions | grep "^{program}$"',
        f'command -v {program}',
    ]

    for command in check_commands:
        try:
            installed = subprocess.check_output(command, shell=True, stderr=subprocess.DEVNULL)
            if installed:
                print(f"{program} ist installiert.")
                CHECK_CACHE[program] = True
                return True
        except subprocess.CalledProcessError:
            pass

    if os.path.isdir(f"/Applications/{program}.app"):
        print(f"{program} ist im Verzeichnis /Applications installiert.")
        CHECK_CACHE[program] = True
        return True

    print(f"{program} ist nicht installiert.")
    CHECK_CACHE[program] = False
    return False

# Funktion zur Installation der Programme
def install_programs() -> None:
    while True:
        answer = input("Möchtest du die Programme installieren? (j/n) ").lower()

        if answer in ['j', 'ja']:
            for program in PROGRAMS:
                if not check_program_installed(program):
                    print(f"Installiere {program}...")
                    try:
                        subprocess.check_call(f'brew install --cask {program}', shell=True, stderr=subprocess.DEVNULL)
                    except subprocess.CalledProcessError:
                        print(f"Fehler beim Installieren von {program}.")
            break
        elif answer in ['n', 'nein']:
            print("Programme nicht installiert.")
            break
        else:
            print("Ungültige Eingabe. Bitte antworte mit 'j' für Ja oder 'n' für Nein.")

# Überprüfung der Programme
for program in PROGRAMS:
    check_program_installed(program)

# Installation der Programme
install_programs()
