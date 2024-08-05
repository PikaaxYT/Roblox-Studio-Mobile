echo "Installing UFW (firewall)..."
sudo apt -q -y install ufw
echo "Installing XFCE..."
sudo apt -q -y install xfce4 xfce4-goodies
echo "Installing ngrok..."
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| sudo tee /etc/apt/sources.list.d/ngrok.list \
	&& sudo apt update -q -y \
	&& sudo apt install -q -y ngrok
read -p "Paste your ngrok authtoken here:" authtoken
ngrok config add-authtoken $authtoken
echo "Setting up Firefox's prerequisites..."
sudo add-apt-repository ppa:mozillateam/ppa
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
echo "Installing Firefox..."
sudo apt install -q -y --allow-downgrades firefox
echo "Setting up Wine's prerequisites..."
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings 
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
echo "Updating packages..."
sudo apt update -q -y
echo "Installing Wine..."
sudo apt install --install-recommends -q -y winehq-stable
echo "Installing VNC Server..."
sudo apt install -q -y tightvncserver
vncserver
cd .vnc
cp xstartup xstartup.bak
echo "xstartup file backed up"
wget https://raw.githubusercontent.com/PikaaxYT/Roblox-Studio-Mobile/master/xstartup
cd ~/
echo "Installing NoVNC..."
git clone https://github.com/novnc/noVNC.git
sudo apt-get install -q -y python3-pip
pip3 install numpy
cd noVNC
openssl req -new -x509 -days 365 -nodes -out self.pem -keyout self.pem
wget https://raw.githubusercontent.com/PikaaxYT/Roblox-Studio-Mobile/main/startvnc.sh
chmod u+x startvnc.sh
sudo vncserver :1 -geometry 1280x1024 -depth 32
ngrok tcp 5901
