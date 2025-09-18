#!/bin/zsh
PRN_NAME="${1:-Xerox-Floor1}"
PRN_URI="${2:-lpd://print01/$PRN_NAME}"
cancel -a 2>/dev/null || true
lpadmin -x "$PRN_NAME" 2>/dev/null || true
lpadmin -p "$PRN_NAME" -E -v "$PRN_URI" -m everywhere
lpoptions -p "$PRN_NAME" -o printer-is-shared=false
echo "Printer heal test $(date)" | lp -d "$PRN_NAME"
echo "Done."
