#!/bin/bash
apt install wget -y
clear

echo ███████╗ ██████╗ ██╗      ██████╗ ███████╗██╗██████╗     ██╗   ██╗██████╗ ███████╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
echo ██╔════╝██╔═══██╗██║     ██╔═══██╗╚══███╔╝██║██╔══██╗    ██║   ██║██╔══██╗██╔════╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
echo ███████╗██║   ██║██║     ██║   ██║  ███╔╝ ██║██████╔╝    ██║   ██║██████╔╝███████╗    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
echo ╚════██║██║   ██║██║     ██║   ██║ ███╔╝  ██║██╔═══╝     ╚██╗ ██╔╝██╔═══╝ ╚════██║    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
echo ███████║╚██████╔╝███████╗╚██████╔╝███████╗██║██║          ╚████╔╝ ██║     ███████║    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
echo ╚══════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚══════╝╚═╝╚═╝           ╚═══╝  ╚═╝     ╚══════╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
                                                                                                                                                            

echo Create your own free VPS Hosting!

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
wget https://raw.githubusercontent.com/SolozipDev/Vps-Bot-Files-V3/refs/heads/main/Dockerfile
wget https://raw.githubusercontent.com/SolozipDev/Vps-Bot-Files-V3/refs/heads/main/anti.sh
wget https://raw.githubusercontent.com/SolozipDev/Vps-Bot-Files-V3/refs/heads/main/bot.py
wget https://raw.githubusercontent.com/SolozipDev/Vps-Bot-Files-V3/refs/heads/main/requirements.txt
echo "Installation successful"

clear

echo "Install the newly loaded files"
docker build -t ubuntu-22.04-with-tmate -f Dockerfile1 . && pip install docker discord

clear

echo "Enter the discord bot token"
read -r TOKEN
echo "Updating main.py with token bot Discord is provided..."
sed -i "s/TOKEN = ''/TOKEN = '$TOKEN'/" bot.py

clear

echo "Let's start the bot"
echo "python3 main.py"
python3 main.py
