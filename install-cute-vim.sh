#!/usr/bin/env bash

REPO_URL="https://github.com/sad-unixoid/CUTE_VIM.git"
BRANCH="main"                                     
DIR="$HOME/CUTE_VIM"
CLONE_DIR="$HOME/.vim_config_backup"

package_managers=("apt" "yum" "dnf" "pacman")
package=("git" "npm" "vim")

if ! command -v git >/dev/null 2>&1; then 
    echo "Vim не установлен!"
fi

if ! command -v git >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1; then
  echo "Не найдены git, npm." >&2
    for manager in "${package_managers[@]}"; do
        if command -v "$manager" > /dev/null 2>&1; then
            echo "- $manager"
            if [ "$manager" = "pacman" ]; then
                sudo pacman -S git npm
            elif [ "$manager" = "apt" ]; then
                sudo apt install git npm
            elif [ "$manager" = "dnf" ]; then
                sudo dnf install git npm
            elif [ "$manager" = "yum" ]; then
                sudo yum install git npm
            fi
        fi
    done
fi

if [ $? -ne 0 ]; then
    echo "Не удалось определить пакетный менеджер."
fi

if [ -e "$HOME/.vimrc" ]; then
  BACKUP="$HOME/.vimrc.backup.$(date +%F_%H%M%S)"
  echo "Делаю бэкап текущей .vimrc -> $BACKUP"
  cp -a "$HOME/.vimrc" "$BACKUP"
else
  echo "Файла ~/.vimrc нет, бэкап не нужен."
fi

git clone --depth=1 "$REPO_URL" "$DIR"

echo "Устанавливаю новую .vimrc из репозитория..."
cp -a "$DIR/.vimrc" "$HOME/.vimrc"

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "vim-plug не найден. Сначала установите его, например:"
  echo 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  exit 1
fi

# Запускаем vim и выполняем :PlugInstall, затем выходим
vim +PlugInstall +qa
vim

echo "Готово."

