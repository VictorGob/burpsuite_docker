#!/usr/bin/env sh

PROJECT_CONFIG="$HOME/config/project_options.json"
USER_CONFIG="$HOME/config/user_options.json"

set -e

echo "PROJECT_CONFIG=$PROJECT_CONFIG"
echo "USER_CONFIG=$USER_CONFIG"

# exec java -jar "$@" --config-file="$PROJECT_CONFIG" --user-config-file="$USER_CONFIG"
exec java -jar "$@"