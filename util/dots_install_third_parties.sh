#!/usr/bin/env bash

# Install NVM for node management
function install_nvm () {
    if [[ ! -s "$HOME/.nvm/nvm.sh" ]]; then
        echo 'Installing NVM...'
        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
    else
        echo 'NVM already installed'
    fi
}

#Install Git Completion and Git Prompt
function install_git_scripts () {
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
}

function install_third_parties () {
    install_nvm
    install_git_scripts
}
