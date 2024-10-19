JUNEST_SRC_DIR=/tmp/local/junest_src
JUNEST_DIR=/tmp/local/junest

mkdir -p $JUNEST_SRC_DIR $JUNEST_DIR

# ensure running with source ...
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
echo "usage: source <name of me,file>"
echo "Dont run directly. source this file."
exit 1
fi


export JUNEST_HOME=$JUNEST_DIR
export PATH=~/.junest/usr/bin_wrappers:$JUNEST_SRC_DIR/bin:$PATH

git clone --depth 1 --branch 7.4.10 https://github.com/fsquillace/junest.git $JUNEST_SRC_DIR

junest setup


echo "Now run 'junest' to enter your proot"

