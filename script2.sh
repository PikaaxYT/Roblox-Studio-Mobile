echo "Installing UFW (firewall)..."
sudo apt -q -y install ufw
echo "Installing XFCE..."
sudo apt -q -y install xfce4
echo "Installing ngrok..."
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| sudo tee /etc/apt/sources.list.d/ngrok.list \
	&& sudo apt update -q -y \
	&& sudo apt install -q -y ngrok
read -p "Paste your ngrok authtoken here:" authtoken
ngrok config add-authtoken $authtoken
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
