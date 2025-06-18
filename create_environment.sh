#!/bin/bash

read -p "please enter your names:" user_names
mkdir -p "submission_reminder_$user_names"
subdir="submission_reminder_$user_names"


mkdir -p "$subdir"/{app,modules,assets,config}
cp ~/reminder.sh "$subdir/app/reminder.sh"
cp ~/functions.sh "$subdir/modules/functions.sh"
cp ~/config.env "$subdir/config/config.env"
cp ~/submissions.txt "$subdir/assets/submissions.txt"

echo "Bior, Git, not submitted" >> "$subdir/assets/submissions.txt"
echo "Kevin, Shell Navigation, not submitted" >> "$subdir/assets/submissions.txt"
echo "Solomon, Shell Basics, not submitted" >> "$subdir/assets/submissions.txt"
echo "Genesis, Shell Scripts, not submitted" >> "$subdir/assets/submissions.txt"
echo "James, Git, submitted" >> "$subdir/assets/submissions.txt"

chmod +x "$subdir/app/reminder.sh"
chmod +x "$subdir/modules/functions.sh"

path="$subdir/startup.sh"
cat << 'EOL' > "$path"
pathdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$pathdir"
source ./config/config.env
source ./modules/functions.sh
bash ./app/reminder.sh
EOL
chmod +x "$path"

echo "completed succesfully"
