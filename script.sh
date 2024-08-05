sudo apt install lxde
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings 
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update
sudo apt install --install-recommends winehq-stable
sudo apt install snapd
snap install ngrok
read -p "Paste authoken here:" AUTHTOKEN
ngrok config add-authtoken $AUTHTOKEN
sudo apt install xrdp -y
sudo adduser xrdp ssl-cert
sudo systemctl restart xrdp
sudo ufw allow 3389
nohup ./ngrok tcp 3389
echo "Your RDP IP is on Ngrok's Endpoints page"
