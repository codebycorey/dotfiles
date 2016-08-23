#!/bin/sh

echo "Hello, World";

# Install NVM for node management
if [[ ! -s "$HOME/.nvm/nvm.sh" ]]; then
    echo 'Installing NVM...'
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
else
    echo 'NVM already installed'
fi

# Install RVM for ruby Management
if [[ ! -s "$HOME/.rvm/scripts/rvm" ]]; then
    echo 'Installing RVM...'
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash
else
    echo 'RVM already installed'
fi

# Install git completion
if [[ ! -s "$HOME/.git-completion.bash" ]]; then
    echo 'Installing Git Completion...'
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
else
    echo 'Git completion already installed'
fi

# Install git prompt
if [[ ! -s "$HOME/.git-prompt.sh" ]]; then
    echo 'Installing Git Prompt'
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh
else
    echo 'Git Prompt already installed'
fi


#   -----------------------------
#     Bash aliases
#   -----------------------------
if [[ -s "./.personal_aliases" ]]; then
    echo 'Copying Personal Aliases...'
    cp ./.personal_aliases ~/.personal_aliases
fi

if [[ -s "./.system_aliases" ]]; then
    echo 'Copying System Aliases...'
    cp ./.system_aliases ~/.system_aliases
fi

if [[ -s "./.development_aliases" ]]; then
    echo 'Copying Development Aliases...'
    cp ./.development_aliases ~/.development_aliases
fi

if [[ -s "./.mac_aliases" ]]; then
    echo 'Copying Mac Aliases...'
    cp ./.mac_aliases ~/.mac_aliases
fi

if [[ -s "./.bash_profile" ]]; then
    echo 'Copying Bash Profile...'
    cp ./.bash_profile ~/.bash_profile
fi
