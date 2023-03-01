Install Ubuntu 22.04

# Set the computer IP address

Go to Settings -> Network -> Wired -> Settings Gear Icon

Go to IPv4:
- Manual
- Address: 192.168.1.133
- Netmask: 24 (will turn into 255.255.255.0)
- Gateway: 192.168.1.1

Apply

Flick the switch near the interface twice to restart and apply the settings.

# Install basic programs

```bash
$ sudo apt update && sudo apt dist-upgrade

$ sudo apt install -y fzf \
ccache \
suckless-tools \
xdotool \
numlockx \
ranger \
nitrogen \
gedit \
htop \
tree \
gdebi \
hexchat \
gimp \
git \
git-lfs \
cmake-curses-gui \
fonts-font-awesome \
arandr \
libpcre3-dev \
meson \
thunar \
lxappearance \
numix-gtk-theme \
numix-icon-theme \
libgtk-3-dev \
qdirstat \
screenfetch \
lm-sensors \
net-tools \
pavucontrol \
thunar-archive-plugin \
gnome-screenshot \
autoconf \
snapd \
gnome-flashback \
flatpak \
brightnessctl \
stress \
openssh-server \
tightvncserver
```

```bash
sudo snap install core

sudo snap install gitkraken --classic
sudo snap install discord
sudo snap install code --classic

sudo snap install clion --classic

# OBS Studio
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install ffmpeg obs-studio

# FSearch
sudo add-apt-repository -y ppa:christian-boxdoerfer/fsearch-daily
sudo apt install -y fsearch
```

## trashy

```bash
cd programs/
git clone https://gitlab.com/trashy/trashy.git
cd trashy/
autoreconf --install
automake
./configure
make
sudo make install
```

# Create default folders

```sh
cd && mkdir projects programs
```

Clone this repository into ~/programs

# dotfiles

Remove target folders/directories listed in the `dotfiles/install_links.sh` file.

Following command will attempt to symlink them from this repo to target directory.

```bash
cd ~/programs/installation-secondary-pc/dotfiles
chmod +x ./install_links.sh
./install_links.sh
```

# Set up ssh and vnc

```bash
cp ~/programs/installation-secondary-pc/dotfiles/.vnc ~/.vnc
chmod +x ~/.vnc/*

sudo ufw disable
```

## Default directories

```bash
gsettings set org.gnome.gnome-screenshot auto-save-directory "~/Pictures/screenshots"
```

## Drivers

```bash
# First https://superuser.com/questions/714391/how-do-i-remove-all-i386-architecture-packages-from-my-debian-installation
sudo dpkg --remove-architecture i386

sudo ubuntu-drivers autoinstall
```

## ROS2 Stuff

https://docs.ros.org/en/humble/Installation.html

### ccache

https://ccache.dev/manual/latest.html#_location_of_the_primary_configuration_file

~/.cache/ccache/ccache.conf

```yaml
# Set maximum cache size
max_size = 100G
```

### Cyclone DDS

https://github.com/eclipse-cyclonedds/cyclonedds#run-time-configuration

~/cyclonedds.xml

## flatpak
```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

# Screen sleep

```bash
# Sleep only after 10m
gsettings set org.gnome.desktop.session idle-delay 600

# Never sleep
gsettings set org.gnome.desktop.session idle-delay 0
```

# chrony configuration

```bash
cd
mkdir configs_backup && cd configs_backup
cp /etc/chrony/chrony.conf ./
cd ~/programs/installation-secondary-pc
sudo cp configs/chrony.conf /etc/chrony/chrony.conf

sudo systemctl restart chronyd.service
systemctl is-active chronyd.service
chronyc sources -v
```

# Clone the repositories

Clone following into ~/projects:
- https://github.com/vautonomous/autoware
- https://github.com/vautonomous/volt_scripts

```bash
cd projects/volt_scripts/

find ~/projects/volt_scripts/ -type f -name "*" -exec chmod +x {} \;

```
