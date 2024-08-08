sudo apt install qemu-system
wget https://computernewb.com/isos/windows/Win8.1_English_x64.iso
qemu-img create -f qcow2 win8.qcow2 30G
qemu-system-x86_64 -enable-kvm -m 6G -smp 2 -hda win8.qcow2 -boot d -cdrom Win8.1_English_x64.iso -netdev user,id=net0,net=192.168.0.0/24,dhcpstart=192.168.0.9 -device rtl8139,netdev=net0 -vga qxl -device AC97 -vnc :1
-enable-kvm                                                    \
-m 4G                                                          \
-smp 2                                                         \
-hda myVirtualDisk.qcow2                                       \
-boot d                                                        \
-cdrom linuxmint-21.1-cinnamon-64bit.iso                       \
-netdev user,id=net0,net=192.168.0.0/24,dhcpstart=192.168.0.9  \
-device virtio-net-pci,netdev=net0                             \
-vga qxl                                                       \
-device AC97
