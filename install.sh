#!/bin/bash
apt install wget -y
clear

echo "ᴍᴀᴋᴇᴅ ʙʏ - 𝖘𝖔𝖑𝖔𝖟𝖎𝖕"

echo Create Your Own Free VPS Hosting!

read -p "Are you sure you want to continue? Agree to create or not? (y/n): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation aborted."
    exit 1
fi

clear

echo "Install python3-pip and docker."
sudo apt update
sudo apt install -y python3 python3-pip docker.io
echo "Installation successful"

clear

echo "Install the necessary files"
wget https://raw.githubusercontent.com/SoloKingzzZ/VPS-DC-BOT-V4-FILES/refs/heads/main/Dockerfile
wget https://raw.githubusercontent.com/SoloKingzzZ/VPS-DC-BOT-V4-FILES/refs/heads/main/bot.py
wget https://raw.githubusercontent.com/SoloKingzzZ/VPS-DC-BOT-V4-FILES/refs/heads/main/anti.sh
wget https://raw.githubusercontent.com/SoloKingzzZ/VPS-DC-BOT-V4-FILES/refs/heads/main/requirements.txt
echo "Installation successful"

clear

echo "Install the downloaded files"
docker build -t ubuntu-22.04-with-tmate -f Dockerfile . && pip install docker discord

clear

echo "Enter discord bot token"
read -r TOKEN
echo "Updating bot.py with provided Discord bot token..."
sed -i "s/TOKEN = ''/TOKEN = '$TOKEN'/" bot.py

clear

echo "Let's start botting"
echo "python3 bot.py"
python3 bot.py
