#/bin/bash

cwd=$(cd "$(dirname ${0})" && pwd)
cd ${cwd}

for file in .zshrc .zshenv .gitconfig .gitignore_global .vimrc; do
    echo ${file}
    if [ -f ~/${file} ]; then
        mv ~/${file} ~/${file}.org
    fi
    if [ ! -L ~/${file} ]; then
        ln -sf ${cwd}/${file} ~/${file}
    fi
done

if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
    mkdir -p ~/.vim/bundle
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
source ~/.zshrc
