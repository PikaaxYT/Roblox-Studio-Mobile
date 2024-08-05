echo "Installing NoVNC..."
cd ~/
git clone https://github.com/novnc/noVNC.git
sudo apt-get install -q -y python3-pip
pip3 install numpy
cd noVNC
openssl req -new -x509 -days 365 -nodes -out self.pem -keyout self.pem
