#!/bin/sh

echo "Hello, World";

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > .git-completion.bash

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > .git-prompt.sh
