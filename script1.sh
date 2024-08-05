echo "Installing UFW (firewall)..."
sudo apt -q -y install ufw
echo "Installing XFCE..."
sudo apt -q -y install xfce4 xfce4-goodies
echo "Setting up Wine's prerequisites"
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
vim xstartup
