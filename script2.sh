echo "Installing ngrok..."
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| sudo tee /etc/apt/sources.list.d/ngrok.list \
	&& sudo apt update -q -y \
	&& sudo apt install -q -y ngrok
read -p "Paste authtoken here:" $authtoken
ngrok config add-authtoken authtoken
echo "Installing QEMU..."
sudo apt install -q -y qemu-system
echo "Downloading Windows..."
wget https://computernewb.com/isos/windows/Win8.1_English_x64.iso
echo "Creating virtual disk..."
sudo qemu-img create -f qcow2 win8.qcow2 40G
echo "Creating QEMU virtual machine..."
sudo qemu-system-x86_64 -enable-kvm -m 6G -smp 2 -hda win8.qcow2 -boot d -cdrom Win8.1_English_x64.iso -netdev user,id=net0,net=192.168.0.0/24,dhcpstart=192.168.0.9 -device rtl8139,netdev=net0 -vga qxl -device AC97 -vnc :1
ngrok tcp 5901
