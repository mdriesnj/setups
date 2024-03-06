#if [ "$EUID" -ne 0 ]
#  then echo "Please run as root"
#  exit
#fi

sudo passwd -l root
sudo apt install vim
sudo apt install zsh
sudo apt install git
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
rm /home/mdries/.zshrc
rm /home/mdries/.vimrc
sh -c "$(wget http://www.digitaldiscord.org/.vimrc)"
sh -c "$(wget http://www.digitaldiscord.org/.zshrc)"
sudo cp .vimrc /root/
sudo cp .zshrc /root/
mkdir ~/.ssh
wget -O ~/.ssh/authorized_keys http://www.digitaldiscord.org/authorized_keys
sudo wget -O /etc/ssh/sshd_config http://www.digitaldiscord.org/sshd_config
sudo systemctl restart sshd
