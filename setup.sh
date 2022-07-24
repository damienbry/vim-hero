echo "Ormancer Vim Hero Config"
echo "Setup started..."

echo "- installing color schemes"
mkdir -p ~/.vim/colors
cp -r ./colors ~/.vim

echo "Installing plugins"
echo "- installing plugin manager: vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "- installing custom plugins & custom config"
cp ./vim-config.vim ~/.vimrc
cp ./random_emoji.sh ~/.vim/random_emoji.sh

echo "- installing snippets"
mkdir -p ~/.vim/snippets
cp ./snippets/* ~/.vim/snippets

echo "- simlinking vim config to neovim's"
mkdir ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

#echo "- copy fish scripts"
#rm -rf ~/.config/fish
#cp -r ./fish ~/.config
#
#echo "- install fish plugins"
#fish -c "fisher self-update"
#fish -c "fisher add franciscolourenco/done"
#fish -c "fisher add acomagu/fish-async-prompt"
#
#echo "- launch fish paramters"
#fish -c "set -U fish_prompt_pwd_dir_length 0" # show full path
#fish -c "set -U __done_min_cmd_duration 10000" # done plugin

echo "Setup finished ! Do a :PlugInstall vim and let's roll \o/"

