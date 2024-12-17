#!/bin/bash

# Ensure the environment variables are set
if [ -z "$TS_HOSTNAME" ] || [ -z "$TS_TAILNAME" ]; then
  echo "Error: TS_HOSTNAME and TS_TAILNAME must be set"
  exit 1
fi

# Define the file you want to modify (example: config file or template)
TARGET_FILE="/etc/systemd/system/feedbin-init.service"

# Replace the placeholder ${TS_HOSTNAME}.${TS_TAILNAME} in the target file
sed -i "s/\${TS_HOSTNAME}\.\${TS_TAILNAME}/$TS_HOSTNAME.$TS_TAILNAME/g" "$TARGET_FILE"

# Optionally, print the modified content for verification
# cat "$TARGET_FILE"

# Start the main process (replace with your container's main process)
exec "$@"
