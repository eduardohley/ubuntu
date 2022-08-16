lazygit_url="https://github.com/jesseduffield/lazygit/releases/download/v0.35/lazygit_0.35_Linux_x86_64.tar.gz"
neovim_url="https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage"
bitwarden_url="https://github.com/bitwarden/clients/releases/download/desktop-v2022.8.0/Bitwarden-2022.8.0-x86_64.AppImage"

lazygit_tar="lazygit.tar.gz"
lazygit_app="lazygit"
bitwarden_app="bitwarden.appimage"
neovim_app="neovim.appimage"

cat << EOF | xargs -n 2 -P 8 wget -O
$lazygit_tar $lazygit_url
$bitwarden_app $bitwarden_url
$neovim_app $neovim_url
EOF

tar -zxf $lazygit_tar $lazygit_app 
rm $lazygit_tar

chmod +x $lazygit_app 
chmod +x $bitwarden_app
chmod +x $neovim_app

sudo mv $lazygit_app /usr/local/bin/gg
sudo mv $bitwarden_app /usr/local/bin/bw
sudo mv $neovim_app /usr/local/bin/nvim

sudo apt install tilix -y

which gg
which bw
which nvim