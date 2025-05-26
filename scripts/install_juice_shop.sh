#!/bin/bash

# Exit on error and log all commands
set -e
set -x

# Configuration
PROJECT_FOLDER="/home/azureuser/juice-shop"  # Azure default home dir
PORT=3000  # Default Juice Shop port

# Install required tools
echo "📦 Installing system dependencies..."
sudo apt-get update
sudo apt-get install -y curl git

# Install Node.js 18 from NodeSource
echo "⬇️ Installing Node.js 18..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Confirm node and npm versions
node -v
npm -v

# Clone Juice Shop (official repo)
echo "📥 Cloning OWASP Juice Shop..."
if [ ! -d "$PROJECT_FOLDER" ]; then
  git clone https://github.com/juice-shop/juice-shop.git "$PROJECT_FOLDER"
else
  echo "⚠️  Juice Shop already cloned. Skipping."
fi

# Navigate to project folder
cd "$PROJECT_FOLDER"

# Install project dependencies
echo "🚀 Installing Juice Shop dependencies..."
npm install

# Start Juice Shop (background process)
echo "🛡️ Starting Juice Shop on port $PORT..."
npm start &

# Print access instructions
PUBLIC_IP=$(curl -s ifconfig.me)
echo "✅ Juice Shop is now running!"
echo "🔗 Access at: http://$PUBLIC_IP:$PORT"
