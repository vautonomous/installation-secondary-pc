alias polen3="ssh nuc@145.239.94.13 -i ~/.ssh/polen3"
alias polen3_files="sshfs nuc@145.239.94.13:/ /home/nuc/ssh_remote/polen3 -o IdentityFile=~/.ssh/polen3"

alias rm="trashy"

alias fuss="fusermount -u /home/nuc/ssh_remote/"

alias gedit="gedit --new-window"

alias upp="sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove"

alias soii="source install/setup.bash"
alias sorr="source devel/setup.bash"

alias adee="cd ~/adehome/AutowareAuto && ade enter"

alias ade_sim="cd ~/adehome/AutowareAuto && ade --rc .aderc-lgsvl start --update --enter"

alias autoo="cd ~/projects/AutowareAuto/ && source ~/projects/AutowareAuto/install/setup.bash"

alias colbu="colcon build --symlink-install "

alias colbu_rd="colbu --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=1 "
alias colbu_r="colbu --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 "
alias colbu_d="colbu --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 "

alias colbu_sel_rd="colbu_rd --packages-select "
alias colbu_sel_r="colbu_r --packages-select "
alias colbu_sel_d="colbu_d --packages-select "

alias colbu_upto_rd="colbu_rd --packages-up-to "
alias colbu_upto_r="colbu_r --packages-up-to "
alias colbu_upto_d="colbu_r --packages-up-to "

alias colbsr="colbu_sel_rd"
alias colbur="colbu_upto_rd"

alias soro1="source /opt/ros/noetic/setup.bash"
alias sorof="source /opt/ros/foxy/setup.bash"
alias sorog="source /opt/ros/galactic/setup.bash"
alias soroh="source /opt/ros/humble/setup.bash"
alias soror="source /home/nuc/projects/ros2_rolling_ws/install/setup.bash"

alias autt="source /home/nuc/projects/autoware/install/setup.bash"
alias soisu="source /home/nuc/projects/autoware_isuzu/install/setup.bash"


alias power_limit="sudo nvidia-smi -i 0 -pl 170"

alias mine_it="cd /home/nuc/crypto/ethereum/miner/t-rex-0.20.3-linux/ && /home/nuc/crypto/ethereum/miner/t-rex-0.20.3-linux/0_nuc_ethermine.sh"

alias mine_it_cool="cd /home/nuc/crypto/ethereum/miner/t-rex-0.20.3-linux && /home/nuc/crypto/ethereum/miner/t-rex-0.20.3-linux/0_nuc_ethermine_less_intense.sh"

alias qtcreator="/opt/Qt5.15.2/Tools/QtCreator/bin/qtcreator"

alias acf="ament_clang_format --config /home/nuc/projects/AutowareAuto/.clang-format --reformat"
alias au="ament_uncrustify --reformat"

alias humb_arm="docker run --rm -it -v /home/nuc/projects/autoware_humble:/autoware ghcr.io/autowarefoundation/autoware-universe:humble-latest-arm64"

alias clean_ws="trashy install log && ls build/ --color=auto -a  | grep -xv -e '.idea' -e '.' -e '..' -e 'compile_commands.json' -e '.built_by' | sed 's/.*/\"build\/&\"/' | xargs -I{} bash -c 'trashy {}'"

clean_pkg () {
  find build install -maxdepth 1 -name ${1} | sed 's/.*/\"&\"/' | xargs -I{} bash -c 'trashy {}'
}
