#!/bin/bash

REMOTE_SERVER="user@your-server-ip"
REMOTE_DIR="/path/to/deploy"
GIT_REPO="git@github.com:yourusername/yourrepo.git"
BRANCH="main"
SERVICE_NAME="myapp"

echo "Starting deployment to $REMOTE_SERVER..."

ssh $REMOTE_SERVER << 'DEPLOY'
  set -e

  echo "$(date) - Connected to the server."

  if [ ! -d "$REMOTE_DIR" ]; then
    echo "Error: Directory $REMOTE_DIR does not exist. Exiting..."
    exit 1
  fi

  cd "$REMOTE_DIR"

  echo "Fetching latest changes from $GIT_REPO on branch $BRANCH..."
  git pull origin "$BRANCH" || { echo "Git pull failed. Exiting..."; exit 1; }

  echo "Restarting $SERVICE_NAME..."
  if systemctl restart "$SERVICE_NAME"; then
    echo "$(date) - $SERVICE_NAME restarted successfully!"
  else
    echo "Error restarting $SERVICE_NAME. Check logs for more details."
    exit 1
  fi

  echo "Deployment completed successfully!"
DEPLOY

echo "Deployment script execution finished."
