Install Ubuntu 22.04

# Set the computer IP address

Go to Settings -> Network -> Wired -> Settings Gear Icon

Go to IPv4:
- Manual
- Address: 192.168.1.133
- Netmask: 24 (will turn into 255.255.255.0)
- Gateway: 192.168.1.1
- DNS: 8.8.8.8 and Automatic is enabled.

Apply

Flick the switch near the interface twice to restart and apply the settings.

Go to Settings -> Network -> Wifi -> Disable wifi.

# Install basic programs

Open up Software & Updates app

- Ubuntu Software
  - Download from: Main server
- Updates
  - Subscibed to: Security and recommended updates
  - Aut. check for updates: Never
  - When there are sec upd: Display immediately
  - When there are other upd: Display every two weeks
  - Notify me of a new Ub ver: Never

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
tightvncserver \
xfce4 \
xfce4-goodies
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
cd && mkdir projects programs dds_logs
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
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh
```

Run `vncserver` once and give it a password for connecting to it later on. Default: `asdasd`

Then terminate it with `vncserver -kill :3` (replace `3` with the instance that got launched on previous command.)

```bash
cp ~/programs/installation-secondary-pc/dotfiles/.vnc ~/.vnc
chmod +x ~/.vnc/*

sudo ufw disable
```

Then configure the service using:

```bash
cp ~/programs/installation-secondary-pc/services/vncserver@.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable vncserver@1.service
sudo systemctl start vncserver@1.service
```

To connect to it from the primary pc, use the following commands from the primary pc:

```bash
# On terminal 1
## Following command will not return anything and block that terminal
ssh -L 59000:localhost:5901 -C -N -l nuc 192.168.1.133

# On terminal 2
vncviewer
## connect to localhost:59000 with default `asdasd` password.
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

Also configure the chrony on the other computer to share its clock with this pc's ip address.

```bash
cd
mkdir configs_backup
cp /etc/chrony/chrony.conf ~/configs_backup
sudo cp ~/programs/installation-secondary-pc/configs/chrony.conf /etc/chrony/chrony.conf

sudo systemctl restart chronyd.service
systemctl is-active chronyd.service
chronyc sources -v
```

# DDS performance configurations

```bash
sudo gedit /etc/sysctl.d/10-cyclone-max.conf
```

Add the following into the file:

```conf
net.core.rmem_max=2147483647
net.ipv4.ipfrag_time=3
net.ipv4.ipfrag_high_thresh=134217728
```

reboot the computer.

# Clone the repositories

Clone following into ~/projects:
- https://github.com/vautonomous/autoware
- https://github.com/vautonomous/volt_scripts

```bash
cd projects/volt_scripts/

find ~/projects/volt_scripts/ -type f -name "*" -exec chmod +x {} \;

```

Install the Autoware following https://github.com/vautonomous/autoware-documentation/blob/main/docs/installation/autoware/source-installation.md (Don't use ansible!)


# Install the UI Process Manager service

```bash
cp ~/programs/installation-secondary-pc/services/ui_process_manager.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable ui_process_manager.service
sudo systemctl start ui_process_manager.service
watch -n 0.1 "systemctl status ui_process_manager.service"
```


