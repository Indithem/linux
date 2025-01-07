JUNEST_SRC_DIR=/tmp/local/junest_src
JUNEST_HOME=/tmp/local/junest

set -e
mkdir -p $JUNEST_SRC_DIR $JUNEST_DIR

# ensure running with source ...
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
echo "usage: source <name of me,file>"
echo "Dont run directly. source this file."
exit 1
fi

JUNEST_VERSION=7.4.10

wget https://github.com/fsquillace/junest/archive/refs/tags/$JUNEST_VERSION.zip -O $JUNEST_SRC_DIR/.zip
unzip -o $JUNEST_SRC_DIR/.zip -d $JUNEST_SRC_DIR

export JUNEST_HOME=$JUNEST_HOME
export PATH=~/.junest/usr/bin_wrappers:$JUNEST_SRC_DIR/junest-$JUNEST_VERSION/bin:$PATH

if [ -z "$( ls -A $JUNEST_HOME )" ]; then

# create new root dir
junest setup
cp ./pacman.conf $JUNEST_HOME/etc/pacman.conf

# install packages for user
junest sudo pacman -Syu --noconfirm neovim fish zip git base-devel
junest git clone https://aur.archlinux.org/paru-bin.git $JUNEST_SRC_DIR/paru
cd $JUNEST_SRC_DIR/paru
junest makepkg -si

fi

alias jf='junest fish'


echo "Now you can run 'junest' to enter proot"
echo "Use alias 'jf' to open fish directly."


