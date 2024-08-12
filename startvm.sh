sudo qemu-system-x86_64 -enable-kvm -m 12G -smp 4 -hda win8.qcow2 -boot d -cdrom Win8.1_English_x64.iso -netdev user,id=net0,net=192.168.0.0/24,dhcpstart=192.168.0.9 -device rtl8139,netdev=net0 -vga qxl -vnc :1
ngrok tcp 5901
