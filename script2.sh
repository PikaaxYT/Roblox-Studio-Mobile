cd ~/
git clone https://github.com/novnc/noVNC.git
cd noVNC
openssl req -new -x509 -days 365 -nodes -out self.pem -keyout self.pem
