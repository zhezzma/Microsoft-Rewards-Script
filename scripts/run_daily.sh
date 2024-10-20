#!/bin/bash

# Set up environment variables
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

# Ensure TZ is set
export TZ=${TZ}

source /root/.nvm/nvm.sh

# Change directory to the application directory
cd /root/workspace/microsoft-rewards-script

# Check if NO_SLEEP is set and true
if [[ -z "${NO_SLEEP}" || "${NO_SLEEP}" != "true" ]]; then
    # Define the minimum and maximum wait times in seconds
    MINWAIT=$((5*60))  # 5 minutes
    MAXWAIT=$((50*60)) # 50 minutes

    # Calculate a random sleep time within the specified range
    SLEEPTIME=$((MINWAIT + RANDOM % (MAXWAIT - MINWAIT)))

    # Convert the sleep time to minutes for logging
    SLEEP_MINUTES=$((SLEEPTIME / 60))

    # Log the sleep duration
    echo "Sleeping for $SLEEP_MINUTES minutes ($SLEEPTIME seconds)..."

    # Sleep for the calculated time
    sleep $SLEEPTIME
else
    echo "NO_SLEEP is set to true. Skipping sleep..."
fi

# Log the start of the script
echo "Starting script..."

# Update config with environment variables before running the script
node src/updateConfig.js

killall  Xvfb
# Execute the Node.js script directly
xvfb-run --server-args="-screen 0 1280x1024x24" npm run start