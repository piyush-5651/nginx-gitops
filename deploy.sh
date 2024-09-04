#!/bin/bash

# Pull the latest changes from the Git repository
git pull origin main

# Install NGINX if not installed
if ! [ -x "$(command -v nginx)" ]; then
  echo "NGINX is not installed. Installing NGINX..."
  sudo apt-get update
  sudo apt-get install -y nginx
fi

# Copy the HTML files to the NGINX web directory
sudo cp -r src/* /var/www/html/

# Restart NGINX to apply changes
sudo systemctl restart nginx
