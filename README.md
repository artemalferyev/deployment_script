Deployment Script

Overview

This bash script automates the deployment of a web application to a remote server. It pulls the latest changes from a specified Git repository and restarts the service to apply those changes. The script ensures that the deployment is carried out smoothly by performing checks and logging the status of each operation.

Features:
	•	Connects to a remote server via SSH.
	•	Pulls the latest changes from a specified Git repository and branch.
	•	Checks if the specified deployment directory exists.
	•	Restarts the application service on the remote server.
	•	Logs the deployment process with timestamps.

Prerequisites:
	•	SSH access to the remote server.
	•	Git installed on the remote server.
	•	The specified remote directory must exist.
	•	The service to be restarted must be managed by systemctl.
	•	The server must have the necessary permissions to restart the service.

Usage:
	1.	Update the following variables in the script:
	•	REMOTE_SERVER: SSH login credentials of your remote server (e.g., user@your-server-ip).
	•	REMOTE_DIR: Path to the deployment directory on the remote server.
	•	GIT_REPO: URL of the Git repository to fetch from (e.g., git@github.com:yourusername/yourrepo.git).
	•	BRANCH: Git branch you wish to deploy (e.g., main).
	•	SERVICE_NAME: The name of the service to restart (e.g., myapp).
 
	2.	Execute the script on your local machine or CI/CD pipeline:

 ./deploy.sh

 Example:

 REMOTE_SERVER="user@your-server-ip"
REMOTE_DIR="/var/www/myapp"
GIT_REPO="git@github.com:yourusername/myapp.git"
BRANCH="main"
SERVICE_NAME="myapp"

./deploy.sh

Notes:
	•	The script uses ssh to connect to the remote server and perform the deployment steps.
	•	Ensure that your SSH keys are configured for passwordless login.
	•	The script uses git pull to fetch changes from the remote repository.
	•	The service is restarted using systemctl, and if it fails to restart, the script will exit with an error.

Troubleshooting:
	•	If the script fails to connect to the remote server, verify that your SSH credentials and server IP are correct.
	•	If the Git pull fails, check your repository access permissions or verify that the branch exists.
	•	If the service fails to restart, review the logs using journalctl -u myapp (replace myapp with your service name).
