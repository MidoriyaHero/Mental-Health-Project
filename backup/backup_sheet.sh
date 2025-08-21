#!/bin/bash
BACKUP_DIR="./backup"
FILE_ID="1QZyVpIEeENn5k1QQdIH0AeDeHNGp9qbtzfd2TIQslkc"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p "$BACKUP_DIR"

curl -L "https://docs.google.com/spreadsheets/d/$FILE_ID/export?format=xlsx" \
     -o "$BACKUP_DIR/gsheet_backup_$TIMESTAMP.xlsx"

