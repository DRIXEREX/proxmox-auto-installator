#!/bin/s


clear
echo "Bienvenue sur l'installateur de PROXMOX sur debian ! Je suis entrain de faire les choses réquis pour que Proxmox s'installe ! PROXMOX VE 7 !! VERSION NON RECOMMANDE"

#Mettre à jour la machine

apt update -y
apt full-upgrade -y

#Installation de proxmox
echo "deb [arch=amd64] http://download.proxmox.com/debian/pve buster pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg
chmod +r /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg

#Mettre à jour et installer proxmox

apt update -y
apt full-upgrade -y

apt install proxmox-ve postfix open-iscsi -y

cd /etc/apt/sources.list.d
mv pve-enterprise.list pve-enterprise.list.bak


#Optimiser votre machine
apt remove linux-image-amd64 'linux-image-4.19*' -y
update-grub
apt autoremove -y

clear
echo "L'installation est terminé ! Je redémmare votre système !"
reboot
