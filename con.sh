echo export http_proxy="http://proxy22.iitd.ac.in:3128" >> ~/.bashrc
echo export https_proxy="http://proxy22.iitd.ac.in:3128" >> ~/.bashrc

## Junet installation
git clone https://github.com/fsquillace/junest.git ~/.local/share/junest
export PATH=~/.local/share/junest/bin:$PATH
export PATH="$PATH:~/.junest/usr/bin_wrappers"
junest setup
## Junet export
echo junest proot >> ~/.bashrc


